" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"
" Vundle (https://github.com/VundleVim/Vundle.vim)
" Plugins setting
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ctrlp.vim
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"
" Usage:
"  Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode.
"  Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode.
"  Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.
Plugin 'kien/ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc  " Ignore python byte codes

" NerdTree
" A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree'
map <C-t> :NERDTreeToggle<CR>

" vim-airline
Plugin 'bling/vim-airline'
set laststatus=2  " appear all the time
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1

" Conque
" Run terminal inside Vim buffer
"
" Usage:
" :ConqueTerm bash
" :ConqueTermSplit mysql -h localhost -u joe -p sock_collection
" :ConqueTerm python
Plugin 'basepi/vim-conque'

" Command-T
Plugin 'wincent/command-t'

" Vim colorschemes
Plugin 'flazz/vim-colorschemes'

" vim-multiple-cursors
" Muliple-cursors works as in Sublime 
Plugin 'terryma/vim-multiple-cursors'

" YankRing
" Maintains a history of Yank
Plugin 'vim-scripts/YankRing.vim'
let g:yankring_replace_n_pkey='<leader>p'           " Replace previous key
let g:yankring_replace_n_nkey='<leader>n'           " Replace next key
nnoremap <silent> <F9> :YRShow<CR>

"
" Python related
"


" Python-mode
" A collection of python utilities for Vim
Plugin 'klen/python-mode'
let g:pymode_rope=0                " Disable rope support
let g:pymode_doc=0                 " Disable python documentation
let g:pymode_lint=0                " Disable code checking

" syntastic
" Syntax checking hacks for vim
"
" Setup:
" Require flake8 in virtualenv
" $ pip install flake8
"
" Usage:
" :Errors    Display the errors for the current buffer
Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" jedi-vim
" Python autocompletion
"
" Usage:
" Completion <C-Space>
" <leader>g    Goto assignments (typical goto function)
" <leader>d    Goto definitions (follow identifier as far as possible, includes
" imports and statements)
" K            Show Documentation/Pydoc (shows a popup with assignments)
" <leader>r    Renaming
" <leader>j    Usages (shows all the usages of a name)
" :Pyimport    Open module, e.g. :Pyimport os (opens the os module)
" <leader>b    Set, unset breakpoint
Plugin 'davidhalter/jedi-vim'
let g:jedi#completions_command = "<C-Space>"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"
" Other settings
"

" Syntax highlight
syntax on
set background=dark
colo peaksea

" Allow 'u' to undo Ctrl-U and Ctrl-W
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Make backspace work as other editors
set backspace=indent,eol,start

" Make clipboard works between OS and vim
set clipboard=unnamedplus

" Use CTRL-S for saving, also in Insert mode
" (Note: It requires the codes that makes terminal ignore Ctrl-s in '~/.bashrc')
" http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR> " This does not work in iTerm2, not sure about other terminal

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Natural split opening
set splitbelow
set splitright

" Enable mouse
set mouse=a

" Rebind <Leader> key
let mapleader = ","

" Highlight for search
set hls
nnoremap <silent> <C-N> :nohlsearch<CR>

" Easier moving between tabs
map <Leader>[ <esc>:tabprevious<CR>
map <Leader>] <esc>:tabnext<CR>

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gq)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing

" Set number of history and undo level
set history=1000
set undolevels=1000

" Space for indentation
" 4 spaces charactor for each indentation level
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
au Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" Always open a new tab when using ctrlp.vim
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

"
" Buffer Settings
"

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
" F5 to show buffers and select the buffer by number
nmap <F3> :buffers<CR>:buffer<Space>
