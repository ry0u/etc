runtime! debian.vim

if has("syntax")
  syntax on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set clipboard=unnamedplus

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nocompatible               " be iMproved
filetype off

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle "Shougo/neocomplete.vim"
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle "scrooloose/syntastic"
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'

"haskell
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'

NeoBundle "tyru/caw.vim.git"

"cpp
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

"Markdown
NeoBundle "godlygeek/tabular"
NeoBundle "joker1007/vim-markdown-quote-syntax"
NeoBundle "rcmdnk/vim-markdown"
NeoBundle 'tukiyo/previm'
NeoBundle 'tyru/open-browser.vim'


call neobundle#end()

NeoBundleCheck
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * call ExecuteNERDTree()
endif
 
" カーソルが外れているときは自動的にnerdtreeを隠す
function! ExecuteNERDTree()
    "b:nerdstatus = 1 : NERDTree 表示中
    "b:nerdstatus = 2 : NERDTree 非表示中
 
    if !exists('g:nerdstatus')
        execute 'NERDTree ./'
        let g:windowWidth = winwidth(winnr())
        let g:nerdtreebuf = bufnr('')
        let g:nerdstatus = 1
 
    elseif g:nerdstatus == 1
        execute 'wincmd t'
        execute 'vertical resize' 0
        execute 'wincmd p'
        let g:nerdstatus = 2
    elseif g:nerdstatus == 2
        execute 'wincmd t'
        execute 'vertical resize' g:windowWidth
        let g:nerdstatus = 1
 
    endif
endfunction

setlocal path+="/usr/include/c++/4.8"


"neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#include_paths = {
			\ 'cpp' : '.,/usr/include/c++/4.8',
\ }


"cpp-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"highlight Normal ctermbg=none

"syntastic
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
" C
let g:syntastic_c_check_header = 1
" C++
let g:syntastic_cpp_check_header = 1

"include 
let g:neocomplete#sources#include#paths ={
			\ 'cpp': '.,/usr/include/c++/4.8',
\ 'c': '.,/usr/include',
\ 'ruby': '.,$HOME/.rvm/rubies/**/lib/ruby/1.8/',
\ }


"neosnippet
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
 
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"quickrun
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright 3sp",
\       "outputter/buffer/close_on_empty" : 1,
\	"hook/time/enable" : 1
\   },
\   "tex" : {
\	'command': 'ptex2pdf',
\	'exec': ['%c -l "%S:t:r.tex"','evince "%S:t:r.pdf"']
\   },
\}

"Markdown
let g:vim_markdown_liquid=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
au BufRead,BufNewFile *.md set filetype=markdown

"Previm
cmap po PrevimOpen

cmap qr QuickRun
cmap QR QuickRun

command! -nargs=0 QC call CloseQuickRunWindow()
function! CloseQuickRunWindow()
    execute "normal \<c-c>\<c-w>jZZ"
endfunction
cmap qc QC

nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
cmap nt NERDTree

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>


"caw comment out"
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

colorscheme ron

filetype plugin indent on     " required!
filetype indent on
syntax on

