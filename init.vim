filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'honza/vim-snippets'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround'
Plugin 'dyng/ctrlsf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'thinca/vim-visualstar'
Plugin 'tpope/vim-unimpaired'
Plugin 'chriskempson/base16-vim'
Plugin 'edkolev/promptline.vim'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'Shougo/deoplete.nvim'

call vundle#end()

let mapleader = "\<Space>"

"Changing cursor type in Insert mode

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
set encoding=utf-8
set scrolloff=5
set ruler
set t_Co=256
set completeopt=longest,menuone
set shell=/bin/bash

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

colorscheme myhyb

"Let's find ctag files
set tags=tags;

set pastetoggle=<F10>

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" save file when Vim loses focus
au FocusLost * :wa

set colorcolumn=80
highlight ColorColumn ctermbg=233
highlight LineNr ctermfg=239 ctermbg=233

let g:indentLine_color_term=234

inoremap jj <ESC>

nmap <F2> :NERDTreeToggle<CR>
nmap tt :TagbarToggle<CR>
nmap <F3> :TMToggle<CR>

nnoremap <leader>f 1z=
nnoremap <leader>s :set spell
nmap W :w <CR>
nmap Q :q <CR>
nmap Z :qa <CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

nmap <leader>u :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_help = 0
let g:gundo_close_on_revert = 1
let g:gundo_width = 5

" insert blank lines
nnoremap <silent> oo :<C-u>put=repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> OO :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let g:tabman_number = 0

let g:jedi#completions_enabled=1
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = 'top'
let g:jedi#show_call_signatures = 0

nnoremap <C-t> :tabnew<CR>              " new tab
nnoremap <C-p> :tabprevious<CR>         " previous tab
nnoremap <C-n> :tabnext<CR>             " next tab
inoremap <C-t> :<Esc>tabnew<CR>         " insert mode, new tab
inoremap <C-p> :<Esc>:tabprevious<CR>i  " insert mode, previous tab
inoremap <C-n> :<Esc>:tabnext<CR>i      " insert mode, next tab """"""

nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" CtrlP (new fuzzy finder)
let g:ctrlp_map = '<c-g>'
nmap <Leader>g :CtrlP<CR>
nmap <Leader>T :CtrlPBufTag<CR>
nmap <Leader>t :CtrlPBufTagAll<CR>
nmap <Leader>y :CtrlPLine<CR>
nmap <Leader>f :CtrlPMRUFiles<CR>
nmap <Leader>c :CtrlPCmdPalette<CR>

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

noremap n nzz
noremap N Nzz
noremap <Up> 2<C-y>
noremap <Down> 2<C-e>
nnoremap <silent> - :nohl<CR>

" Make vim understand Cyrilic
set keymap=ukrainian-jcuken
set iminsert=0
set imsearch=0

let g:airline_theme='powerlineish'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1

let g:promptline_preset = {
        \'a' : [ promptline#slices#host() ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ]}
let g:promptline_theme = 'airline'

nnoremap <silent> - :nohl<CR>
let g:python_host_prog = '/usr/bin/python2.7'
let g:deoplete#enable_at_startup = 1