" Make

let g:makeprg_directory  = ""
let g:makeprg_target     = ""
let g:makeprg_options    = "-j 4"
let g:makeprg_executable = "make"

function! Make()
  let make_string = "set makeprg=" . escape(g:makeprg_executable . " " . g:makeprg_options . " " . g:makeprg_directory . " " . g:makeprg_target, ' \')
  echo make_string
  exec make_string
  wa
  make
endfunction

function! SetMakeTarget()
  call inputsave()
  let g:makeprg_target = input("Make target: ")
  call inputrestore()
endfunction

function! SetMakeOptions()
  call inputsave()
  let g:makeprg_options = input("Make options: ")
  call inputrestore()
endfunction

function! SetMakeDirectory()
  call inputsave()
  let g:makeprg_directory = input("Make directory: ")
  if strlen(g:makeprg_directory) > 0
    let g:makeprg_directory="-C " . g:makeprg_directory
  endif
  call inputrestore()
endfunction

map ,mt :call SetMakeTarget()<CR>
map ,mo :call SetMakeOptions()<CR>
map ,md :call SetMakeDirectory()<CR>
