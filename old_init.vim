" Autoinstall vim-plug {{{
" -------------------------------------------------------------
filetype off
if empty(glob("~/nvim/autoload/plug.vim"))
    !curl -fLo ~/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" }}}

" Plugins {{{
" -------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Navigation plugins {{{
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'wesQ3/vim-windowswap'
Plug 'szw/vim-maximizer' "Use F3
Plug 'tpope/vim-eunuch'
Plug 'danro/rename.vim'
" }}}

" Syntax plugins {{{
Plug 'ntpeters/vim-better-whitespace',
Plug 'raimon49/requirements.txt.vim',{ 'for': 'requirements'}
" Plug 'elzr/vim-json',                { 'for': 'json'}
Plug 'w0rp/ale',
Plug 'editorconfig/editorconfig-vim',
" Plug 'vim-syntastic/syntastic',
" }}}

" JS plugins {{{
Plug 'raimon49/requirements.txt.vim',{ 'for': 'requirements'}
Plug 'pangloss/vim-javascript',       { 'for': 'javascript' }
Plug 'mxw/vim-jsx',                   { 'for': 'javascript' }
Plug 'chemzqm/vim-jsx-improve',       { 'for': 'javascript' }
Plug 'epilande/vim-react-snippets',   { 'for': 'javascript' }
" }}}


" Python plugins {{{
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'nvie/vim-flake8',              { 'for': 'python' } "Use F7
Plug 'tell-k/vim-autopep8',          { 'for': 'python' }
Plug 'tweekmonster/impsort.vim',     { 'for': 'python' }
Plug 'davidhalter/jedi-vim',         { 'for': 'python' }
Plug 'neoclide/coc.nvim',            {'branch': 'release'}
" }}}

" Autocomplete engines {{{
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

" Plug 'Shougo/deoplete.nvim',         {'do': function('DoRemote')}
" Plug 'Shougo/neco-syntax'
" }}}

" Html plugins {{{
Plug 'vim-scripts/django.vim',
Plug 'gregsexton/MatchTag',
Plug 'mattn/emmet-vim'
Plug 'mitsuhiko/vim-jinja',
" }}}

" Useful plugins {{{
Plug 'ervandew/supertab'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-commentary'
" }}}

" Docker plugins {{{
Plug 'ekalinin/Dockerfile.vim'
" }}}

" Autoformat plugins {{{
Plug 'Chiel92/vim-autoformat'
" }}}

" Git plugins {{{
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'djoshea/vim-autoread'
Plug 'airblade/vim-gitgutter'
" }}}

" Plug 'edkolev/tmuxline.vim'

" Themes {{{
Plug 'chriskempson/base16-vim'
" }}}

" Session plugins {{{
Plug 'tpope/vim-obsession'
" }}}

Plug 'thinca/vim-visualstar'
Plug 'jmcantrell/vim-virtualenv'

" Tag plugins {{{
Plug 'ludovicchabant/vim-gutentags'
" }}}

" Test plugins {{{
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
" }}}

" Dispatch plugins {{{
Plug 'tpope/vim-dispatch'
Plug 'aliev/vim-compiler-python'
Plug 'radenling/vim-dispatch-neovim'
" }}}

" Snippets plugins {{{
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}

" Helpful plugins {{{
Plug 'FooSoft/vim-argwrap'
" Open file:line
Plug 'bogado/file-line'
Plug 'vim-scripts/BufOnly.vim'
" }}}

call plug#end()

let mapleader = "\<Space>"

" Statusline {{{
set statusline=
set statusline=%<       " where to truncate
set statusline+=\ %{expand('%:h')}/
set statusline+=%*%t%* " filename
set statusline+=\ %m%r  " modified, readonly, filetype
set statusline+=%=      " switch to right-hand side
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%{ObsessionStatus()}
set statusline+=%y      " filetype
set statusline+=\ %P    " percentage
set statusline+=\|%l:%c " cusor line and column
set statusline+=\|%L\ | " number of lines
" }}}

"Opens vsp on right side
set splitright

" allow plugins by file type
filetype on
filetype plugin on
filetype indent on

syntax on
set laststatus=2
set incsearch
set ignorecase
set bs=2
set history=1000
set undolevels=1000
set gdefault
set hlsearch
set path+=**
set nofoldenable
set number
set scrolloff=5
set ruler
set t_Co=256
set completeopt=longest,menuone
set shell=/bin/zsh
set autoread

"Indents handling
set autoindent
set tabstop=4
set shiftwidth=4
set showmatch
set switchbuf=usetab
set expandtab

set nocursorcolumn
set nocursorline
syntax sync minlines=256
set number relativenumber

" Yank to system clipboard
nnoremap gy "+y
vnoremap gy "+y
nnoremap gd "+d
vnoremap gd "+d
vnoremap gY "+Y
nnoremap gY "+y$
" Paste from system clipboard
nnoremap gp "+p
vnoremap gp "+p
nnoremap gP "+P
" Paste from yank clipboard
nnoremap <leader>p "0p
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Colorscheme {{{
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-ocean
set background=dark
" }}}

"Let's find ctag files
set tags=tags;

set pastetoggle=<F10>

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=full

set colorcolumn=140

" Indent settings
let g:indentLine_color_term=239
let g:indentLine_char = '¦'
let g:indentLine_faster = 1

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

nmap W :w<CR>
nmap Q :q<CR>
nmap QA :qa<CR>

" Moving in insert mode
inoremap jj <ESC>
inoremap HH <C-o>I
inoremap LL <C-o>A
inoremap KK <C-o>O
inoremap JJ <C-o>o
inoremap CC <C-o>C
inoremap SS <C-o>S

nmap <F2> :NERDTreeToggle<CR>
nmap tt :TagbarToggle<CR>

let NERDTreeShowHidden=1

" insert blank lines
nnoremap <silent> oo :<C-u>put=repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> OO :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-p> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
inoremap <C-t> :<Esc>tabnew<CR>

nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" FZF PLUGIN SETTINGS
nnoremap <C-g> :Files<CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>ag :Ag<space>

 "Git status
nnoremap <leader>gs :GFiles?<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>fr :Locate<space>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>tt :Windows<CR>
nnoremap <leader>T :Tags<CR>
nnoremap <leader>hh :History<CR>
nnoremap <leader>: :History:<CR>
nnoremap <leader>/ :History/<CR>
nnoremap <leader>c :Commands<CR>
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=test'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" FZF END

noremap n nzz
noremap N Nzz

noremap <Up> 2<C-y>
noremap <Down> 2<C-e>
nnoremap <silent> - :nohl<CR>

nmap <leader>ff :CtrlSF 
nmap <leader>ft :CtrlSFToggle<CR>
nmap <leader>j :CtrlSF <c-r><c-w>

nmap <leader><leader>r :checktime<CR>

let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '100%'

let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let g:tabman_number = 0

"Better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo

" Create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

set mouse=a

" Python hosts
let g:python3_host_prog = glob('~/.virtualenvs/neovim3/bin/python3')
let g:python_host_prog = glob('~/.virtualenvs/neovim/bin/python')

" Fix trouble in neovim
 if has('nvim')
     nmap <BS> <C-W>h
     nmap <bs> :<c-u>TmuxNavigateLeft<cr>
 endif

let g:SuperTabDefaultCompletionType = "<c-n>"

set foldmethod=indent
set foldlevel=140

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview = 1

" Enable Silver search
let g:ackprg = 'ag --nogroup --nocolor --column'
set rtp+=~/.fzf

"Impsort settings
nnoremap <leader>ii :<c-u>ImpSort!<cr>

" autodetect python, js and html filetype
autocmd BufRead,BufNewFile *.py set filetype=python
autocmd BufRead,BufNewFile *.js set filetype=javascript
autocmd BufRead,BufNewFile *.ts set filetype=typescript
autocmd BufRead,BufNewFile *.yml set filetype=yaml
autocmd BufRead,BufNewFile *.html set filetype=html
autocmd BufNewFile,BufRead *.template set filetype=htmldjango

let g:ctrlp_max_files=20000

" FUGITIVE SETTINGS
nnoremap ,w :Gwrite<CR>
nnoremap ,c :Gcommit<CR>
nnoremap ,s :Gstatus<CR>
nnoremap ,d :Gdiff<CR>
nnoremap ,b :Gblame<CR>
nnoremap ,l :Glog<CR>
nnoremap ,la :Glog --<CR>
" END FUGITIVE

"SURROUND SETTINGS
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
"END SURROUND

autocmd FileType css setlocal shiftwidth=2 tabstop=2 colorcolumn=80
autocmd FileType sass setlocal shiftwidth=4 tabstop=4 colorcolumn=80
autocmd FileType gitcommit setlocal colorcolumn=51 textwidth=72
autocmd FileType template,html,markdown,htmldjango,jinja setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 colorcolumn=80
autocmd FileType python setlocal colorcolumn=140
autocmd FileType rst setlocal filetype=text
autocmd FileType text setlocal shiftwidth=2 textwidth=100 colorcolumn=100
autocmd FileType xml setlocal shiftwidth=4 tabstop=4
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 colorcolumn=100

set diffopt+=vertical

" Syntastic {{{
nmap st :SyntasticToggleMode<CR>
let g:syntastic_javascript_checkers = ['eslint']
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') !=# '' ? ['eslint'] : []
let g:syntastic_python_flake8_args='--ignore=E501,E999'
" }}}

"Finding .jscs from root upwards
function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . cfg : ''
endfunction

" Deoplete settings {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:neoinclude#ctags_commands = 'tags'
" let g:deoplete#auto_complete_start_length = 0
let deoplete#tag#cache_limit_size = 50000000
" }}}

" Yank to system clipboard
nnoremap gy "+y
vnoremap gy "+y
vnoremap gY "+Y
nnoremap gY "+y$
" Paste from system clipboard
nnoremap gp "+p
vnoremap gp "+p
nnoremap gP "+P

" Autoformat settings {{{
" -------------------------------------------------------------
noremap <leader>ss :Autoformat<CR>
vnoremap <leader>ss :'<,'>Autoformat<CR>

let g:formatters_python = ['autopep8']
let g:autopep8_max_line_length=100
" }}}

" Gutentags settings {{{
let g:gutentags_enabled = 1
nnoremap cot :GutentagsToggle<cr>
autocmd FileType GV GutentagsDisable
command! GutentagsEnable :let g:gutentags_enabled=1<bar>echom "Gutentags enabled."
command! GutentagsDisable :let g:gutentags_enabled=0<bar>echom "Gutentags disabled."
command! GutentagsToggle
            \ :let g:gutentags_enabled=!g:gutentags_enabled
            \ <bar>echom "Gutentags ".(g:gutentags_enabled ? "enabled." : "disabled.")
" }}}

" Vim test runner settings {{{
let test#python#runner = 'nosetest'
let test#strategy = "vimux"

nnoremap <leader>t :TestNearest --keepdb<CR>
nnoremap <leader>tf :TestFile --keepdb<CR>

" }}}

autocmd BufNewFile,BufRead *.json set ft=javascript

" Emmet setting for JSX
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" let g:UltiSnipsExpandTrigger="<c-l>"

nmap <F9> :set ignorecase! ignorecase?<CR>
set diffopt+=vertical

let g:jedi#force_py_version = 2
set omnifunc=jedi#completions
