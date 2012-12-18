# dotjs-zen Markdown

Convert Markdown to HTML in Google Chrome with a keystroke.  Uses [nathan7](https://github.com/nathan7/dotjs-zen)'s [dotjs-zen](https://github.com/nathan7/dotjs-zen).

## Installation
First, make sure you install `dotjs-zen`.

The installation is pretty rough right now because it requires a couple of third part code changes.  First, `npm install` dependencies for the `lib` directory.

Change line 336 of `lib/node_modules/jquery/node_modules/jsdom/lib/jsdom/browser/index.js` from this:

`defaultParser = require('node-htmlparser/lib/node-htmlparser');`

to this:

`defaultParser = require('htmlparser/lib/node-htmlparser');`

There is another incompatability in `Showdown` that is already bundled in `lib/vendor/showdown.js`.  The "Automatic Extension Loading (node only):" section is removed completely because it mistakenly assumes it's running in `node` when it's being compiled by `browserify` and will actually be executed by the browser.

Last, symlink `path/to/dotjs-zen-markdown/lib/markdown-to-html.js` to `~/.js/site-you-want.com.js`.  dotjs-zen doesn't support default scripts yet, but hopefully it will [soon](https://github.com/nathan7/dotjs-zen/pull/2).

## Usage
Type `CTRL` + `M` in a text input field or textarea.  Its contents will be converted from Markdown to HTML.
