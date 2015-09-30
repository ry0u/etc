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
" set guifont=Monospace\ 10
set guifont=DejaVu\ Sans\ Mono\ 10
set tabstop=4
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set number
set autoindent
set smartindent
set hlsearch
set splitbelow
set splitright
set columns=106
set lines=42
set t_Co=256
colorscheme lucius
set background=dark
highlight Normal ctermbg=none
autocmd FileType html,javascript colorscheme molokai
autocmd FileType json colorscheme af

noremap j gj
noremap k gk
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap ; :
inoremap <silent> jj <ESC>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap [<Enter> []<Left><CR><ESC><S-o>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nmap <Tab> gt
nmap <S-Tab> gT
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
nmap <silent> <Esc><Esc> :nohlsearch<CR>

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
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'scrooloose/nerdtree'
NeoBundle "Shougo/neocomplete.vim"
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle "scrooloose/syntastic"
NeoBundle 'thinca/vim-quickrun'
NeoBundle "tyru/caw.vim.git"
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'sudo.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'troydm/easybuffer.vim'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'gregsexton/VimCalc'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tyru/restart.vim'
NeoBundle 'kana/vim-submode'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundleLazy "sjl/gundo.vim", {
\ "autoload": {
\   "commands": ['GundoToggle'],
\ }}
NeoBundle 'tpope/vim-endwise'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'wannesm/wmgraphviz.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundleLazy "osyo-manga/vim-sugarpot", {
\   'autoload' : {
\       'commands' : [
\           {
\               "name" : "SugarpotPreview",
\               "complete" : "file",
\           }
\       ]
\   }
\}

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
NeoBundle 'flazz/vim-colorschemes'

"haskell
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'

"cpp
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight'

"dlang
NeoBundle 'JesseKPhillips/d.vim'

"Python
NeoBundleLazy "davidhalter/jedi-vim"
NeoBundleLazy "vim-pandoc/vim-pandoc", {
\ "autoload": {
\   "filetypes": ["text", "pandoc", "markdown", "rst", "textile"],
\ }}

" java
NeoBundle 'tpope/vim-classpath'
NeoBundle 'KamunagiChiduru/unite-javaimport', {
\   'depends': ['Shougo/unite.vim', 'yuratomo/w3m.vim'],
\}
NeoBundleLazy 'vim-scripts/javacomplete', {
\   'build': {
\       'cygwin': 'javac autoload/Reflection.java',
\       'mac': 'javac autoload/Reflection.java',
\       'unix': 'javac autoload/Reflection.java',
\   },
\}

" Ruby
NeoBundle 'vim-ruby/vim-ruby'

"Markdown
NeoBundle "godlygeek/tabular"
NeoBundle "joker1007/vim-markdown-quote-syntax"
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'tukiyo/previm'
NeoBundle 'tyru/open-browser.vim'

"HTML/CSS/Javascript
NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'ap/vim-css-color'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'moll/vim-node'
NeoBundle 'mattn/jscomplete-vim'
NeoBundle 'myhere/vim-nodejs-complete'

" json
NeoBundle 'elzr/vim-json'

"AOJ
NeoBundle 'mopp/AOJ.vim'

"Twitter
NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'mattn/favstar-vim'

"Aruduio
NeoBundle "sudar/vim-arduino-syntax"


call neobundle#end()

NeoBundleCheck

let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    " autocmd VimEnter * call ExecuteNERDTree()
    " autocmd VimEnter * VimFilerCurrentDir -split -winwidth=30 -no-quit
    autocmd VimEnter * VimFilerCurrentDir
endif

if has('vim_starting')
    autocmd VimEnter * call s:Transset("0.85")
endif

" vimshell
nnoremap <Space>v  :35vs<CR>:<C-u>VimShellBufferDir<CR>

" function! ExecuteNERDTree()
"     if !exists('g:nerdstatus')
"         execute 'NERDTree ./'
"         let g:windowWidth = winwidth(winnr())
"         let g:nerdtreebuf = bufnr('')
"         let g:nerdstatus = 1
" 
"     elseif g:nerdstatus == 1
"         execute 'wincmd t'
"         execute 'vertical resize' 0
"         execute 'wincmd p'
"         let g:nerdstatus = 2
"     elseif g:nerdstatus == 2
"         execute 'wincmd t'
"         execute 'vertical resize' g:windowWidth
"         let g:nerdstatus = 1
"     endif
" endfunction

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
nnoremap <Leader>f :VimFiler<Enter>
nnoremap <Leader>fs :VimFiler -split<Enter>
setlocal path+="/usr/include/c++/4.8"
"let &l:include = '^\s*\%(\%(public\|static\)\s\+\)\?\<import'
"let &l:includeexpr = 'substitute(substitute(v:fname, "\\.", "/", "g"), "$", ".d", "")'

"neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#include_paths = {
\ 'cpp' : '.,/usr/include/c++/4.8',
\ 'd': '.,/usr/include/dmd/phobos'
\ }


"cpp-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"syntastic
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_tex_checkers=['chktex']
let g:syntastic_java_javac_config_file_enabled = 1


"include 
let g:neocomplete#sources#include#paths ={
\ 'cpp': '.,/usr/include/c++/4.8',
\ 'c': '.,/usr/include',
\ 'ruby': '.,$HOME/.rvm/rubies/**/lib/ruby/1.8/',
\ 'd': '.,/usr/include/dmd/phobos',
\ }

"neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1
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
\	},
\   "html" : {
\   'command': 'open',
\   'exec': '%c %s',
\   'outputter': 'browser'
\   } 
\}


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
let g:vim_markdown_folding_disabled=1
au BufRead,BufNewFile *.md set filetype=markdown

"Previm
cmap po PrevimOpen

"open-browser
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>gg :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

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

"restat
let g:restart_sessionoptions = 'blank,curdir,folds,help,tabpages'

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

"neosnippet
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

noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>

"caw comment out"
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"translate
nnoremap <silent> tr :<C-u>ExciteTranslate<CR>

"Transset
function! s:Transset(opacity)
    call system('transset --id ' . v:windowid . ' ' . a:opacity)
endfunction
command! -nargs=1 Transset call <SID>Transset(<q-args>) 

"set guifont
function! s:ChangeFontSize(size)
    execute ':set guifont=DejaVu\ Sans\ Mono\' a:size
endfunction
command! -nargs=1 CF call <SID>ChangeFontSize(<q-args>)

"contest
function! s:MakeProblem()
    
endfunction

" submode.vim
" " [C-w],[+]または、[C-w],[-]
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')

"YankRing
nmap ,y :YRShow<CR>

"undotree.vim
nmap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 'topleft'
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = "UnderLined"

"java syntax highlight
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_allow_cpp_keywords=1
let g:java_highlight_functions=1

autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo

" switch.vim
" nnoremap * :call switch#Switch(g:variable_style_switch_definitions)<cr>
nnoremap T :Switch<cr>

" gundo.vim 
nnoremap <Leader>g :GundoToggle<CR>

" python
autocmd FileType python setlocal completeopt-=preview

" Tweetvim
let g:tweetvim_display_icon = 1
let g:tweetvim_tweet_per_page = 60

let s:bundle = neobundle#get("vim-sugarpot")
function! s:bundle.hooks.on_source(bundle)
    let g:sugarpot_font = "DejaVu\ Sans\ Mono\ 10"
    let g:sugarpot_convert_resize = "50%x34%"
endfunction
unlet s:bundle

nnoremap <silent><Leader>tw :<C-u>tabnew <Bar> TweetVimHomeTimeline<CR>
nnoremap <silent><Leader>tl :<C-u>TweetVimHomeTimeline<CR>
nnoremap <silent><Leader>tm :<C-u>TweetVimMentions<CR>

filetype plugin indent on     " required!
filetype indent on
syntax on

