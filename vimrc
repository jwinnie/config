func Backspace()
  if col('.') == 1
    if line('.')  != 1
      return  "\<ESC>kA\<Del>"
    else
      return ""
    endif
  else
    return "\<Left>\<Del>"
  endif
endfunc

inoremap <BS> <c-r>=Backspace()<CR>
set guifont=Fira\ Code:h18
set autoread
set ruler
set incsearch
syntax enable
set encoding=utf8
set nobackup
set nowb
set noswapfile
set smarttab
set ai
set si
set wrap
set number
set visualbell
inoremap <D-CR> <ESC>:
nnoremap <D-CR> :
startinsert
