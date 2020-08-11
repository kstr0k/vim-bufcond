Do things to buffers depending on their status.

E.g. `call bufcond#BufDo( 'bw', { v -> !len( v.windows ) && !v.changed }, #{} )` wipes out unmodified buffers which are not active in any tab/window.

Installing: just drop in packpath (I personally use minpac which is almost the same thing). Autoloadable functions for now.