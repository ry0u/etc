" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif

" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org

" Source a global configuration file if available
if filereadable("/etc/vim/gvimrc.local")
  source /etc/vim/gvimrc.local
endif

colorscheme desert
colorscheme lucius
"highlight Normal ctermbg=none

syntax on

set nocompatible
set guifont=Monospace\ 10
set guifont=DejaVu\ Sans\ Mono\ 10
"set guifont=Ricty\ 10
set tabstop=4
set shiftwidth=4
set nobackup
set number
set autoindent
set smartindent
set columns=106
set lines=42

"tab
nmap <Tab> gt
nmap <S-Tab> gT
