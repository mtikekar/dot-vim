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

if !exists('g:loaded_matchit')
    runtime! macros/matchit.vim
endif

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
" leave 1 line above/below when scrolling
set scrolloff=1

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
filetype plugin indent on
syntax enable

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
" trailing whitespace setting (vim-better-whitespace)
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

" supertab setting
let g:SuperTabDefaultCompletionType = "context"

augroup templates
  au!
  " read in template files
  autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/templates/template.'.expand("<afile>:e")

  " parse special text in the templates after the read
  autocmd BufNewFile * %s/\v:VIM_EVAL:(.{-}):END_EVAL:/\=eval(submatch(1))/ge
augroup END

" New BSV files use tabs, in existing files check for tabs
function TabOrSpace()
    if search("^\t", "nw") == 0
        setlocal expandtab
        setlocal shiftwidth=4 tabstop=4 softtabstop=4
    else
        setlocal noexpandtab
        setlocal shiftwidth=2 tabstop=2 softtabstop=2
    endif
endfunction

autocmd BufReadPost *.bsv call TabOrSpace()
autocmd BufNewFile *.bsv setlocal noexpandtab shiftwidth=2 tabstop=2 softtabstop=2
