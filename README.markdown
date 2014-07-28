[![Build Status](https://secure.travis-ci.org/rolandwalker/vector-utils.png?branch=master)](http://travis-ci.org/rolandwalker/vector-utils)

# Overview

Vector-manipulation utility functions for Emacs.

## Quickstart

```elisp
(require 'vector-utils)
 
(vector-utils-flatten '[1 2 [3 4 [5 6 7]]])
;; '[1 2 3 4 5 6 7]
 
(vector-utils-depth '[1 2 [3 4 [5 6 7]]])
;; 3
```

## vector-utils

Vector-utils is a collection of functions for vector manipulation.
This library has no user-level interface; it is only useful for
programming in Emacs Lisp.

Furthermore (when programming in Emacs Lisp), be aware that the
modification of a vector is not permitted: only vector *elements*
may be changed.  All "modification" operations herein can only
work by making copies, which is not efficient.

The following functions are provided:

	vector-utils-depth
	vector-utils-flatten
	vector-utils-insert-before
	vector-utils-insert-after
	vector-utils-insert-before-pos
	vector-utils-insert-after-pos

To use vector-utils, place the vector-utils.el library somewhere
Emacs can find it, and add the following to your ~/.emacs file:

```elisp
(require 'vector-utils)
```

## Compatibility and Requirements

	GNU Emacs version 24.4-devel     : yes, at the time of writing
	GNU Emacs version 24.3           : yes
	GNU Emacs version 23.3           : yes
	GNU Emacs version 22.2           : yes
	GNU Emacs version 21.x and lower : unknown

No external dependencies

## See Also
[Why you should not modify vectors](http://emacswiki.org/emacs/VectorUsage)
