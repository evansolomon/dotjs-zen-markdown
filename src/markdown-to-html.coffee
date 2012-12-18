# Keep track of our keys
activeKeys = []
ctrl       = 17
m          = 77

# Load dependencies
$ = require 'jquery'
showdown = require './vendor/showdown.js'
converter = new showdown.converter()

# Cache the document object
$document = $ document

# Toggle undoing conversion
lastHTML = lastText = null

# Bind key listeners
$document.keydown ( event ) ->
	key = event.keyCode
	activeKeys[ key ] = true
	markdownify event if activeKeys[ ctrl ] and activeKeys[ m ]

$document.keyup ( event ) ->
	key = event.keyCode
	activeKeys[ key ] = false

# Convert markdown to HTML
markdownify = ( event = null ) ->
	# Make sure this doesn't submit a form
	event?.preventDefault?()

	$el = $ ':focus'
	value = $el.val()
	return if not value

	return $el.val lastText if value == lastHTML

	lastText = value

	html = converter.makeHtml value
	lastHTML = html
	$el.val html
