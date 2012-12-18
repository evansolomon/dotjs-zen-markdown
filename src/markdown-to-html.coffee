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
	event.preventDefault?()

	$el = $ ':focus'
	return if not $el.val()

	html = converter.makeHtml $el.val()
	$el.val html
