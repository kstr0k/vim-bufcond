# vim-bufcond

_Do things to buffers depending on their status_

## Copyright

Copyright 2020 `Alin Mr. <almr.oss@outlook.com>`. MIT license.

## Examples

- `:call bufcond#BufDo( 'bw', { v -> !len( v.windows ) && !v.changed }, #{} )` wipes out unmodified buffers which are not active in any tab/window. First argument is a command or a lambda, second is a lambda to filter `getbufinfo()` results, third is a dictionary passed to `getbufinfo()`.
- same as above, but merely unload (if loaded): `call bufcond#BufDo( { b -> execute( 'bunload ' .. b ) }, { v -> !len( v.windows ) && !v.changed && v.loaded }, #{} )`
- get comprehensive info on loaded buffers, using [Bufferize](https://github.com/AndrewRadev/bufferize.vim): `Bufferize echo join( bufcond#BufDo( { v -> v->bufinfo()[0] }, { v -> v.loaded }, #{} ), "\n" )`

See [bufcond.vim](autoload/bufcond.vim)

## Installation

With `vim` 8+, just drop in packpath (I personally use [minpac](https://github.com/k-takata/minpac) which is almost the same thing). Autoloadable functions for now.
