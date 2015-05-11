runtime! debian.vim

if has("syntax")
  syntax on
endif

"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set clipboard=unnamedplus
set nf=alpha
set nocompatible
set guifont=Monospace\ 10
set guifont=DejaVu\ Sans\ Mono\ 10
set tabstop=4
set shiftwidth=4
set expandtab
set nobackup
set number
set autoindent
set smartindent
set columns=106
set lines=42

nnoremap + <C-a>
nnoremap - <C-x>
nnoremap ; :
inoremap <silent> jj <ESC>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap [<Enter> []<Left><CR><ESC><S-o>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>

"tab
nmap <Tab> gt
nmap <S-Tab> gT

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
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'scrooloose/nerdtree'
NeoBundle "Shougo/neocomplete.vim"
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle "scrooloose/syntastic"
"NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle "tyru/caw.vim.git"
NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'YankRing.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'troydm/easybuffer.vim'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'gregsexton/VimCalc'
NeoBundle 'thinca/vim-ref'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

"colorsheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'vim-scripts/rdark'

"haskell
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'

"cpp
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight'

"Markdown
NeoBundle "godlygeek/tabular"
NeoBundle "joker1007/vim-markdown-quote-syntax"
NeoBundle "rcmdnk/vim-markdown"
NeoBundle 'tukiyo/previm'
NeoBundle 'tyru/open-browser.vim'

"AOJ
NeoBundle 'mopp/AOJ.vim'

call neobundle#end()

NeoBundleCheck
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * call ExecuteNERDTree()
    autocmd VimEnter * call s:Transset("0.85")
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
\		"hook/time/enable" : 1
\   },
\   "tex" : {
\	'runner': 'vimproc',
\	'runner/vimproc/updatetime' : 60,
\	'command' : 'ptex2pdf',
\	'exec': ['%c -l "%S:t:r.tex"','evince "%S:t:r.pdf"']
\   },
\	"tex2" : {
\	'runner': 'vimproc',
\	'runner/vimproc/updatetime' : 60,
\	'command'  : 'platex',
\	'exec' : ['%c %s','dvipdfmx %s:r.dvi','evince %s:r.pdf']
\	}
\
\}

let g:syntastic_tex_checkers=['chktex']

cmap qr QuickRun
cmap QR QuickRun

command! -nargs=0 QC call CloseQuickRunWindow()
function! CloseQuickRunWindow()
    execute "normal \<c-c>\<c-w>jZZ"
endfunction

cmap qc QC
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

"Markdown
let g:vim_markdown_liquid=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
au BufRead,BufNewFile *.md set filetype=markdown

"Previm
cmap po PrevimOpen

"AOJ
let g:aoj#user_id = 'ry0u_yd'

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
let g:indent_guides_guide_size=1

"webdict
let g:ref_source_webdict_sites = {
\   'je': {
\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\   },
\   'ej': {
\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\   },
\   'wiki': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   },
\ }
let g:ref_source_webdict_sites.default = 'ej'
 
function! g:ref_source_webdict_sites.je.filter(output)
	return join(split(a:output, "\n")[15 :], "\n")
endfunction

function! g:ref_source_webdict_sites.ej.filter(output)
	return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.wiki.filter(output)
	return join(split(a:output, "\n")[17 :], "\n")
endfunction

nmap <Leader>rj :<C-u>Ref webdict je<Space>
nmap <Leader>re :<C-u>Ref webdict ej<Space>

"lightline
let g:lightline = {
\ 'colorscheme': 'wombat'
\ }
set laststatus=2

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

cmap nt NERDTree
noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>

"caw comment out"
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"translate
nnoremap <silent> tr :<C-u>ExciteTranslate<CR>
"let &HTTP_PROXY='cache.ccs.kogakuin.ac.jp:8080'

"Transset
function! s:Transset(opacity)
    call system('transset --id ' . v:windowid . ' ' . a:opacity)
endfunction
command! -nargs=1 Transset call <SID>Transset(<q-args>) 

"colorscheme wombat
highlight Normal ctermbg=none

filetype plugin indent on     " required!
filetype indent on
syntax on

