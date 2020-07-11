function! bufcond#BufDo( op, tst, iflt ) abort
  let Op = a:op
  if type( a:op ) == 1
    let Op = { n -> execute( a:op .. ' ' .. n ) }
  endif

  let Tst = a:tst
  if type( a:tst ) == 7
    let Tst = { v -> len( v.windows ) > 0 }
  elseif type( a:tst ) == 6
    let Tst = { v -> a:tst }
  elseif type( a:tst ) == 1
    let Tst = { v -> v.name =~ a:tst }
  elseif type( a:tst ) == 0
    let Tst = { v -> v.bufnr == a:tst }
  elseif type( a:tst ) == 3
    let Tst = { v -> index( a:tst, v.bufnr ) >= 0 || index( a:tst, v.name ) >= 0 }
  endif
  return map( filter( getbufinfo( a:iflt ), { _,v -> Tst( v ) }), {_,v -> Op( v.bufnr ) })
endfunction

" Wipeout invisible unmod buffers
" call bufcond#BufDo( 'bw', {v -> !len( v.windows ) && !v.changed }, #{} )
