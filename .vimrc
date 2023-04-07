" https://missing.csail.mit.edu/2020/editors/
set nocompatible
syntax on
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase
set incsearch
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
set noerrorbells visualbell t_vb=
set mouse+=a
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" https://github.com/Kharacternyk/dotcommon#id4
set expandtab
set termguicolors
set hlsearch
set autoindent
" set shiftwidth=4
set tabstop=4
set encoding=utf-8

" https://github.com/Kharacternyk/dotcommon#id5
colorscheme gruvbox
set background=light

" https://github.com/anishathalye/dotfiles/blob/master/vimrc
set scrolloff=5

" /etc/vim/vimrc
set autowrite
