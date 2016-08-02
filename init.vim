filetype off
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'wesQ3/vim-windowswap'
Plug 'szw/vim-maximizer' "Use F3

"Syntax
Plug 'scrooloose/syntastic', { 'for': ['python', 'javascript'] }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' } "Use F7
Plug 'tell-k/vim-autopep8', { 'for': 'python' } "Use F8
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'vim-scripts/django.vim', { 'for': 'htmldjango'}
Plug 'ervandew/supertab', { 'for': 'python' }
Plug 'tweekmonster/impsort.vim', { 'for': 'python' }
Plug 'Shougo/deoplete.nvim', { 'for': 'python' }
Plug 'yggdroot/indentline', {'for': 'python'}
Plug 'vim-scripts/django.vim', { 'for': ['htmldjango', 'html']}
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mklabs/jscs.vim', { 'do': 'npm i jscs -g' }
Plug 'ruanyl/vim-fixmyjs', { 'do': 'npm i fixmyjs -g' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
" Plug 'pgdouyon/vim-evanesco'

"Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'djoshea/vim-autoread'

" Airlines
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Good plugins
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-commentary'

" Themes
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/base16-vim'

" To tweak
Plug 'tpope/vim-obsession'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'craigemery/vim-autotag'

Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-unimpaired'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tmhedberg/SimpylFold'
Plug 'jmcantrell/vim-virtualenv'

call plug#end()

let mapleader = "\<Space>"

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
set relativenumber
set autoread

"Indents handling
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
set cursorline
set showmatch
set switchbuf=usetab

"Helps to insert higlighted in other apps text into vim with just p
set clipboard=unnamed

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-ocean

set background=dark

"Let's find ctag files
set tags=tags;

set pastetoggle=<F10>

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" save file when Vim loses focus
au FocusLost * :wa

set colorcolumn=80

" Indent settings
let g:indentLine_color_term=239
let g:indentLine_char = '¦'
let g:indentLine_faster = 1

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

nmap W :w <CR>
nmap Q :q <CR>
nmap Z :qa <CR>

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

nnoremap <C-t> :tabnew<CR>              " new tab
nnoremap <C-p> :tabprevious<CR>         " previous tab
nnoremap <C-n> :tabnext<CR>             " next tab
inoremap <C-t> :<Esc>tabnew<CR>         " insert mode, new tab

nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" FZF PLUGIN SETTINGS
nnoremap <C-g> :Files<CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>ag :Ag<space>
 "Git status
nnoremap <leader>gs :GFiles?<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>fr :Locate<space>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>tt :BTags<CR>
nnoremap <leader>T :Tags<CR>
nnoremap <leader>hh :History<CR>
nnoremap <leader>: :History:<CR>
nnoremap <leader>/ :History/<CR>
nnoremap <leader>c :Commands<CR>
let g:fzf_tags_command = 'ctags -R'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'String'],
  \ 'hl':      ['fg', 'String'],
  \ 'fg+':     ['fg', 'Normal', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Normal', 'CursorColumn'],
  \ 'hl+':     ['fg', 'String'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" FZF END

noremap n nzz
noremap N Nzz

noremap <Up> 2<C-y>
noremap <Down> 2<C-e>
nnoremap <silent> - :nohl<CR>

nmap <leader>ff :CtrlSF -filetype py 
nmap <leader>ft :CtrlSFToggle<CR>
nmap <leader>j :CtrlSF -filetype py <c-r><c-w>

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

" Make vim understand Cyrilic
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"Airline settings
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline_theme='base16'

let g:deoplete#enable_at_startup = 1

" Python hosts
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Fix trouble in neovim
 if has('nvim')
     nmap <BS> <C-W>h
     nmap <bs> :<c-u>TmuxNavigateLeft<cr>
 endif

let g:SuperTabDefaultCompletionType = "<c-n>"

set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview = 1

" Enable Silver search
let g:ackprg = 'ag --nogroup --nocolor --column'
set rtp+=~/.fzf

"Impsort settings
nnoremap <C-i> :<c-u>ImpSort!<cr>
autocmd BufWritePre *.py ImpSort! "Sort imports on closing file

" autodetect python, js and html filetype
autocmd BufRead,BufNewFile *.py set filetype=python
autocmd BufRead,BufNewFile *.js set filetype=javascript
autocmd BufRead,BufNewFile *.html set filetype=html

let g:ctrlp_max_files=20000

" FUGITIVE SETTINGS
nnoremap ,w :Gwrite<CR>
nnoremap ,c :Gcommit<CR>
nnoremap ,s :Gstatus<CR>
nnoremap ,d :Gdiff<CR>
nnoremap ,b :Gblame<CR>
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
autocmd FileType gitcommit setlocal colorcolumn=51 textwidth=72
autocmd FileType html,markdown,htmldjango,jinja setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 colorcolumn=80
autocmd FileType python setlocal colorcolumn=73,80
autocmd FileType rst setlocal filetype=text
autocmd FileType text setlocal shiftwidth=2 textwidth=80 colorcolumn=80
autocmd FileType xml setlocal shiftwidth=4 tabstop=4

nmap st :SyntasticToggleMode<CR>
set diffopt+=vertical

" JSCS SETTINGS
let g:syntastic_javascript_checkers=['jscs']

"Finding .jscs from root upwards
function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . cfg : ''
endfunction

autocmd FileType javascript let b:syntastic_javascript_jscs_args =
    \ get(g:, 'syntastic_javascript_jscs_args', '') .
    \ FindConfig('-c', '.jscsrc', expand('<amatch>:p:h', 1))

let g:fixmyjs_rc_path = FindConfig('-c', '.jscsrc', expand('<amatch>:p:h', 1))

let g:fixmyjs_engine = 'jscs'
noremap <Leader><Leader>f :Fixmyjs<CR>
