set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gmarik/vundle'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mileszs/ack.vim'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'wincent/Command-T'
Plugin 'kien/ctrlp.vim'
Plugin 'fisadev/vim-ctrlp-cmdpalette'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'

Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Mizuchi/vim-ranger'
Plugin 'scrooloose/syntastic'

call vundle#end()


set nocompatible
set noacd
let mapleader = "\<Space>"

"Changing cursor type in Insert mode
if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

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
set shell=/bin/bash
set completeopt-=preview

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

inoremap jj <ESC>l
inoremap HH <C-o>I
inoremap LL <C-o>A
inoremap KK <C-o>O
inoremap JJ <C-o>o
inoremap CC <C-o>C
inoremap SS <C-o>S

nmap <F2> :NERDTreeToggle<CR>
nmap tt :TagbarToggle<CR>
nmap <F3> :TMToggle<CR>

nnoremap <leader>f 1z=
nnoremap <leader>s :set spell
nmap W :w <CR>
nmap Q :q <CR>
nmap Z :qa <CR>

map <F8> :SyntasticCheck<CR>
map <leader><F8> :SyntasticReset<CR>

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

let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = 'top'
let g:jedi#show_call_signatures = 0

let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_mode_map = {"mode": "passive"}
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5

nnoremap <C-t> :tabnew<CR>              " new tab
nnoremap <C-p> :tabprevious<CR>         " previous tab
nnoremap <C-n> :tabnext<CR>             " next tab
inoremap <C-t> :<Esc>tabnew<CR>         " insert mode, new tab
inoremap <C-p> :<Esc>:tabprevious<CR>i  " insert mode, previous tab
inoremap <C-n> :<Esc>:tabnext<CR>i      " insert mode, next tab """"""
map <leader><leader> :noh<CR>

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

" Open the file on the last exit place
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

" autodetect filetypes
au BufRead,BufNewFile *.py        set filetype=python
au BufRead,BufNewFile *.js        set filetype=javascript
au BufRead,BufNewFile *.html      set filetype=htmldjango
au BufRead,BufNewFile *.css       set filetype=css

" Enable omni completion and set filetype indent settings. 
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS shiftwidth=2 tabstop=2 colorcolumn=80
autocmd FileType html,markdown,htmldjango setlocal omnifunc=htmlcomplete#CompleteTags shiftwidth=2 tabstop=2 colorcolumn=120
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS shiftwidth=2 tabstop=2 colorcolumn=80
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags shiftwidth=2 tabstop=2
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete colorcolumn=73,80

autocmd FileType python setlocal omnifunc=jedi#completions

" nicer colors
highlight DiffAdd           cterm=bold ctermbg=None ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=None ctermfg=167
highlight DiffChange        cterm=bold ctermbg=None ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=235  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=235  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=235  ctermfg=227

" Powerline setup
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set term=xterm-256color
set termencoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
let g:Powerline_symbols = 'fancy'

let g:signify_vcs_list = ['git']

"easy motion section
nmap <Leader> <Plug>(easymotion-prefix)

nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
omap <Leader>t <Plug>(easymotion-bd-wl)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion "
let g:EasyMotion_smartcase = 1

let g:indentLine_enabled = 1

" Vim
let g:indentLine_color_term = 239

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 0
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Mapping for ranger plugin
nnoremap <leader>r :tabe %:p:h<cr>
