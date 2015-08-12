" Using junegunn/vim-plug as plugin manager
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mbbill/undotree', {'on': 'UndotreeShow'}
Plug 'ervandew/supertab'
Plug 'ervandew/snipmate.vim'
Plug 'mtikekar/vim-bsv'
Plug 'dag/vim-fish'
Plug 'tpope/vim-fugitive'
Plug 'ivanov/vim-ipython'
call plug#end()

let mapleader = "-"

" tab options
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

" fold options
set foldmethod=indent
set foldlevel=99
set foldtext=
set foldignore=
nnoremap <space> za

" soft wrap at word boundaries
set linebreak
" always show status line
set laststatus=2

" search options
set incsearch
set hlsearch

set shell=/bin/bash

" move up/down by displayed lines rather than actual lines
nnoremap <up> gk
nnoremap <down> gj
inoremap <up> <C-o>gk
inoremap <down> <C-o>gj

" file type detection and indenting
filetype plugin on
filetype indent on

" solarized options
let g:solarized_termtrans=1
let g:solarized_italic=0
let g:solarized_contrast="high"
set background=dark
colorscheme solarized

" change diff colors
highlight! link DiffText MatchParen
" color the 81st column of wide lines
highlight ColorColumn ctermbg=black guibg=#073642
call matchadd('ColorColumn', '\%81v', 100)
" highlight trailing whitespace
au VimEnter * CurrentLineWhitespaceOff soft
highlight ExtraWhitespace ctermbg=black guibg=#073642

" put temp files in global directory
set viminfo+=n~/.vim/viminfo
set directory^=~/.vim/swaps
set backupdir^=~/.vim/backups
set undofile
set undodir^=~/.vim/undo

" swap C-v and v
nnoremap v <c-v>
nnoremap <c-v> v
vnoremap v <c-v>
vnoremap <c-v> v

" change default filetypes from module-2 and cobol
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.lib set filetype=

" new commands
command ChangeDirectory cd %:p:h
command W w
command Q q
command WQ wq

" new key mappings
" copy to system clipboard (ctrl-v to paste elsewhere)
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" paste from system clipboard
nnoremap <leader>p "+gp
nnoremap <leader>P "+gP
" clear search highlights
nnoremap <silent> , :nohlsearch<cr>
" show syntax information of character under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" gvim settings, put machine-specific settings in gvimrc
if has('gui_running')
    " padding on left
    autocmd BufEnter * sign define dummy
    autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
    highlight! link SignColumn Normal

    set ballooneval
endif
