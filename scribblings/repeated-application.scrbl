;This is free and unencumbered software released into the public domain.
;
;Anyone is free to copy, modify, publish, use, compile, sell, or
;distribute this software, either in source code form or as a compiled
;binary, for any purpose, commercial or non-commercial, and by any
;means.
;
;In jurisdictions that recognize copyright laws, the author or authors
;of this software dedicate any and all copyright interest in the
;software to the public domain. We make this dedication for the benefit
;of the public at large and to the detriment of our heirs and
;successors. We intend this dedication to be an overt act of
;relinquishment in perpetuity of all present and future rights to this
;software under copyright law.
;
;THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
;OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
;ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
;OTHER DEALINGS IN THE SOFTWARE.
;
;For more information, please refer to <http://unlicense.org/>
#lang scribble/manual
@(require
   (for-label
    racket
    repeated-application))
@title{Repeated application}
@author{Vincent Nys}

This package contains two functions which roughly generalize @racket[apply] (though they do not support keyword arguments or a final @racket[list?] argument). They can be used for computing a least fixpoint or for succinctly expressing a finite number of recursive calls.
@defmodule[repeated-application]

@section{API}
@defproc[(apply↑* [f procedure?] [args any]) any]{Applies @racket[f] to @racket[args], to the result of said application, etc. until a fixpoint is reached.}
@defproc[(apply↑ [f procedure?] [n exact-positive-integer?] [args any]) any]{Applies @racket[f] to args, to the result of said application, etc. until @racket[n] applications have been performed. If @racket[n] is @racket[1], this is the same as using @racket[apply].}