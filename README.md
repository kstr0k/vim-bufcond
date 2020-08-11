# vim-bufcond

_Do things to buffers depending on their status_

## Copyright

Copyright 2020 `Alin Mr. <almr.oss@outlook.com>`. MIT license.

## Usage

E.g. `:call bufcond#BufDo( 'bw', { v -> !len( v.windows ) && !v.changed }, #{} )` wipes out unmodified buffers which are not active in any tab/window. First argument is a command or a lambda, second is a lambda to filter `getbufinfo()` results, third is a dictionary passed to `getbufinfo()`.

## Installation

With `vim` 8+, just drop in packpath (I personally use [minpac](https://github.com/k-takata/minpac) which is almost the same thing). Autoloadable functions for now.
