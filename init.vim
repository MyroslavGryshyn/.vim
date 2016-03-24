filetype on
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'dyng/ctrlsf.vim'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'

"Syntax
Plug 'scrooloose/syntastic', { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' } "Use F7
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'vim-scripts/django.vim', { 'for': 'htmldjango'}
Plug 'ervandew/supertab', { 'for': 'python' }
Plug 'Shougo/deoplete.nvim', { 'for': 'python' }

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
set shell=/usr/local/bin/zsh
set relativenumber

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


" colorscheme gruvbox
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-ocean

" colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='soft'

"Let's find ctag files
set tags=tags;

set pastetoggle=<F10>

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" save file when Vim loses focus
au FocusLost * :wa

set colorcolumn=80
" highlight ColorColumn ctermbg=233
" highlight LineNr ctermfg=239 ctermbg=233

let g:indentLine_color_term=243
let g:indentLine_char = '¦'
let g:indentLine_faster = 1

nnoremap <leader>v :vsplit<CR>

" Moving in insert mode
inoremap jj <ESC>
inoremap HH <C-o>I
inoremap LL <C-o>A
inoremap KK <C-o>O
inoremap JJ <C-o>o
inoremap CC <C-o>C
inoremap SS <C-o>S

nnoremap <leader>q :bdelete<cr>

nmap <F2> :NERDTreeToggle<CR>
nmap tt :TagbarToggle<CR>
nmap <F3> :TMToggle<CR>
nmap 00 :SyntasticToggleMode<CR>

nmap W :w <CR>
nmap Q :q <CR>
nmap Z :qa <CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

nmap <leader>u :GundoToggle<CR>

" insert blank lines
nnoremap <silent> oo :<C-u>put=repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> OO :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

nnoremap <C-t> :tabnew<CR>              " new tab
nnoremap <C-p> :tabprevious<CR>         " previous tab
nnoremap <C-n> :tabnext<CR>             " next tab
inoremap <C-t> :<Esc>tabnew<CR>         " insert mode, new tab

nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" CtrlP (new fuzzy finder)
let g:ctrlp_map = '<c-g>'
nmap <Leader>T :CtrlPBufTag<CR>
nmap <Leader>t :CtrlPBufTagAll<CR>
nmap <Leader>y :CtrlPLine<CR>
nmap <Leader>f :CtrlPMRUFiles<CR>

noremap n nzz
noremap N Nzz
noremap <Up> 2<C-y>
noremap <Down> 2<C-e>
nnoremap <silent> - :nohl<CR>

nnoremap <silent> - :nohl<CR>
nmap <leader>ff :CtrlSF -filetype py 
nmap <leader>ft :CtrlSFToggle<CR>
nmap <leader>F :CtrlSF <c-r><c-w>

let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let g:tabman_number = 0

let g:jedi#completions_enabled=1
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = 'top'
let g:jedi#show_call_signatures = 0

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
set keymap=ukrainian-jcuken
set iminsert=0
set imsearch=0

let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline_theme='base16'

let g:python_host_prog = 'python'
let g:deoplete#enable_at_startup = 1

let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '100%'

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
