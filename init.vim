"" Autoinstall vim-plug {{{
"" -------------------------------------------------------------
filetype off
if empty(glob("~/nvim/autoload/plug.vim"))
    !curl -fLo ~/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
"" }}}


"" Plugins {{{
"" -------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'nvie/vim-flake8',              { 'for': 'python' } "Use F7
Plug 'psf/black',                    { 'branch': 'stable' }
Plug 'ntpeters/vim-better-whitespace',
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"
Plug 'vim-scripts/BufOnly.vim'

Plug 'chriskempson/base16-vim'
Plug 'yggdroot/indentline'

Plug 'majutsushi/tagbar'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

" Syntax
Plug 'neoclide/coc.nvim',            {'branch': 'release'}
Plug 'tpope/vim-surround',
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Candidates
Plug 'cakebaker/scss-syntax.vim'
Plug 'tweekmonster/impsort.vim'
Plug 'mattn/emmet-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tweekmonster/django-plus.vim'
Plug 'AndrewRadev/tagalong.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'SmiteshP/nvim-navic'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }


call plug#end()

let mapleader = "\<Space>"

let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsSnippetsDir="/Users/mhryshyn/.vim/UltiSnips"

""" Colorscheme {{{
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-ocean
set background=dark
""" }}}

""" Coc-vim {{{
" Use tab for trigger completion with characters ahead and navigate.

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

""" }}}

""" Statusline {{{
set statusline=
set statusline=%<       " where to truncate
set statusline+=\ %{expand('%:h')}/
set statusline+=%*%t%* " filename
set statusline+=\ %m%r  " modified, readonly, filetype
set statusline+=%=      " switch to right-hand side
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
"" set statusline+=%{ObsessionStatus()}
set statusline+=%y      " filetype
set statusline+=\ %P    " percentage
set statusline+=\|%l:%c " cusor line and column
set statusline+=\|%L\ | " number of lines
""" }}}

"""Opens vsp on right side
set splitright

""" allow plugins by file type
"filetype on
"filetype plugin on
"filetype indent on

""syntax on
set number
set number relativenumber
"set laststatus=2
"set incsearch
set ignorecase
set smartcase
"set bs=2
"set history=1000
"set undolevels=1000
"set gdefault
"set hlsearch
"set path+=**
" set nofoldenable
"set scrolloff=5
"set ruler
"set t_Co=256
set completeopt=longest,menuone
set shell=/bin/zsh
"set autoread

""Indents handling

"set autoindent
"set tabstop=4
"set shiftwidth=4
"set showmatch
set switchbuf=usetab
set expandtab

"set nocursorcolumn
"set nocursorline
"syntax sync minlines=256

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gz <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"" Yank to system clipboard
nnoremap gy "+y
vnoremap gy "+y
"nnoremap gd "+d
"vnoremap gd "+d
"vnoremap gY "+Y
"nnoremap gY "+y$
"" Paste from system clipboard
nnoremap gp "+p
vnoremap gp "+p
nnoremap gP "+P
"" Paste from yank clipboard
"nnoremap <leader>p "0p
"nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"""Let's find ctag files
set tags=tags;

"set pastetoggle=<F10>

"" autocompletion of files and commands behaves like shell
"" (complete only the common part, list the options that match)
"set wildmode=full

"set colorcolumn=140

"" Indent settings
let g:indentLine_color_term=239
let g:indentLine_char = '¦'
let g:indentLine_faster = 1

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

nmap W :w<CR>
nmap X :q<CR>
" nnorema X :q<CR>
nmap QA :qa<CR>

nnoremap <F9> :Black<CR>

""" Moving in insert mode
inoremap jj <ESC>

nmap <F2> :NERDTreeToggle<CR>
nmap tt :TagbarToggle<CR>

nmap cp :let @+ = expand("%:p")<cr>

let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-p> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
inoremap <C-t> :<Esc>tabnew<CR>

" FZF PLUGIN SETTINGS
nnoremap <C-g> :Files<CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>ag :Ag<space>

" Git status
nnoremap <leader>gs :GFiles?<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>
"nnoremap <leader>fr :Locate<space>
nnoremap <leader>bb :Buffers<CR>
"nnoremap <leader>tt <Windows></Windows>
nnoremap <leader>T :Tags<CR>
"nnoremap <leader>hh :History<CR>
"nnoremap <leader>: :History:<CR>
nnoremap <leader>/ :History/<CR>
"nnoremap <leader>c :Commands<CR>
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=test'
" FZF END

"noremap n nzz
"noremap N Nzz

"noremap <Up> 2<C-y>
"noremap <Down> 2<C-e>
nnoremap <silent> - :nohl<CR>

" TODO: Change to smth else
" let g:user_emmet_expandabbr_key='<C-y>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"nmap <leader><leader>r :checktime<CR>

""Better backup, swap and undos storage
"set directory=~/.vim/dirs/tmp     " directory to place swap files in
"set backup                        " make backup files
"set backupdir=~/.vim/dirs/backups " where to put backup files
"set undofile                      " persistent undos - undo after you re-open the file
"set undodir=~/.vim/dirs/undos
"set viminfo+=n~/.vim/dirs/viminfo

"" Create needed directories if they don't exist
"if !isdirectory(&backupdir)
"    call mkdir(&backupdir, "p")
"endif
"if !isdirectory(&directory)
"    call mkdir(&directory, "p")
"endif
"if !isdirectory(&undodir)
"    call mkdir(&undodir, "p")
"endif

set mouse=a

"" Python hosts
let g:python3_host_prog = glob('~/.virtualenvs/neovim/bin/python')

"" Fix trouble in neovim
" if has('nvim')
"     nmap <BS> <C-W>h
"     nmap <bs> :<c-u>TmuxNavigateLeft<cr>
" endif

set foldmethod=indent
set foldlevel=140

"" Enable folding with the spacebar
" nnoremap <space> za

let g:SimpylFold_docstring_preview = 1

""Impsort settings
nnoremap <leader>ii :<c-u>ImpSort!<cr>

"" autodetect python, js and html filetype
autocmd BufRead,BufNewFile *.py set filetype=python
autocmd BufRead,BufNewFile *.js set filetype=javascript
"autocmd BufRead,BufNewFile *.ts set filetype=typescript
"autocmd BufRead,BufNewFile *.yml set filetype=yaml
autocmd BufRead,BufNewFile *.html set filetype=html
autocmd BufNewFile,BufRead *.template set filetype=htmldjango
autocmd BufRead,BufNewFile *.scss set filetype=scss.css

"let g:ctrlp_max_files=20000

"" FUGITIVE SETTINGS
"nnoremap ,w :Gwrite<CR>
"nnoremap ,c :Gcommit<CR>
"nnoremap ,s :Gstatus<CR>
nnoremap ,d :Gdiff<CR>
nnoremap ,b :Git blame<CR>
"nnoremap ,l :Glog<CR>
"nnoremap ,la :Glog --<CR>
set diffopt+=vertical
"" END FUGITIVE

""SURROUND SETTINGS
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
""END SURROUND

autocmd FileType python setlocal colorcolumn=140
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 colorcolumn=140
autocmd FileType scss.css setlocal shiftwidth=2 tabstop=2 colorcolumn=140

autocmd FileType template,html,markdown,htmldjango,jinja setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
"autocmd FileType css setlocal shiftwidth=2 tabstop=2 colorcolumn=80
"autocmd FileType sass setlocal shiftwidth=4 tabstop=4 colorcolumn=80
"autocmd FileType gitcommit setlocal colorcolumn=51 textwidth=72
"autocmd FileType rst setlocal filetype=text
"autocmd FileType text setlocal shiftwidth=2 textwidth=100 colorcolumn=100
"autocmd FileType xml setlocal shiftwidth=4 tabstop=4
"autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 colorcolumn=100

" Autoformat settings {{{
" -------------------------------------------------------------
noremap <leader>ss :Autoformat<CR>
vnoremap <leader>ss :'<,'>Autoformat<CR>

let g:formatdef_autopep8 = "'autopep8 - --range '.a:firstline.' '.a:lastline"
let g:formatters_python = ['autopep8']
let g:autopep8_max_line_length=140
" }}}
"

let g:tagalong_verbose = 1

" Black settings
let g:black_linelength = 79
let g:black_skip_string_normalization = 1
