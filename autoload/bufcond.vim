function! bufcond#BufDo( op, tst, iflt ) abort
  let Op = a:op
  if type( a:op ) == 1
    let Op = { n -> execute( a:op .. ' ' .. n ) }
  endif

  let Tst = a:tst
  if type( a:tst ) == 7  " v:none, v:null
    let Tst = { v -> len( v.windows ) > 0 }
  elseif type( a:tst ) == 6  " v:true
    let Tst = { v -> a:tst }
  elseif type( a:tst ) == 1  " string
    let Tst = { v -> v.name =~ a:tst }
  elseif type( a:tst ) == 0  " number
    let Tst = { v -> v.bufnr == a:tst }
  elseif type( a:tst ) == 3  " list
    let Tst = { v -> index( a:tst, v.bufnr ) >= 0 || index( a:tst, v.name ) >= 0 }
  endif
  " type( lambda ) == 2
  return map( filter( getbufinfo( a:iflt ), { _,v -> Tst( v ) }), {_,v -> Op( v.bufnr ) })
endfunction

" Wipeout invisible unmod buffers
" call bufcond#BufDo( 'bw', {v -> !len( v.windows ) && !v.changed }, #{} )
" echo join( bufcond#BufDo( { v -> v->bufinfo()[0] }, { v -> !v.loaded }, #{} ), "\n" )
"
" see :h getbufinfo()
