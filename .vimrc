" https://missing.csail.mitmedu/2020/editors/
set number
set relativenumber
set hidden
set ignorecase
set smartcase
set noerrorbells
set visualbell
set t_vb=
set mouse=a

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
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
set tabstop=2
set encoding=utf-8

" https://github.com/anishathalye/dotfiles/blob/master/vimrc
set scrolloff=5

" https://marioyepes.com/vim-setup-for-modern-web-development/
set softtabstop=2
set shiftwidth=2
set nowrap
set showmatch

" https://github.com/neoclide/coc.nvim (160)
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
" set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  " inoremap <silent><expr> <c-@> coc#refresh()
  inoremap <silent><expr> <c-@> coc#pum#confirm()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [
  \ 'coc-blade',
  \ 'coc-clangd',
  \ 'coc-css',
  \ 'coc-docker',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-html',
  \ '@yaegassy/coc-intelephense',
  \ 'coc-java',
  \ 'coc-json',
  \ '@yaegassy/coc-laravel',
  \ 'coc-markdownlint',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-pyright',
  \ 'coc-sh',
  \ 'coc-snippets',
  \ 'coc-spell-checker',
  \ 'coc-svg',
  \ 'coc-texlab',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-xml',
  \ 'coc-yaml',
  \]

" https://github.com/vim-airline/vim-airline/issues/1786
let g:airline_symbols_ascii = 1

" https://vi.stackexchange.com/a/24396
let g:vim_json_syntax_conceal=0
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks=0

" https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim (167)
" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      2.0

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

" Use :help 'option' to see the documentation for the given option.

" Disable vi compatibility, if for some reason it's on.
if &compatible
  set nocompatible
endif

" Check if an option was set from a file in $HOME.  This lets us avoid
" overriding options in the user's vimrc, but still override options in the
" system vimrc.
function! s:MaySet(option) abort
  if exists('*execute')
    let out = execute('verbose setglobal all ' . a:option . '?')
  else
    redir => out
    silent verbose execute 'setglobal all' a:option . '?'
    redir END
  endif
  return out !~# " \\(\\~[\\/][^\n]*\\|Lua\\)$"
endfunction

if s:MaySet('backspace')
  set backspace=indent,eol,start
endif
" Disable completing keywords in included files (e.g., #include in C).  When
" configured properly, this can result in the slow, recursive scanning of
" hundreds of files of dubious relevance.
set complete-=i
if s:MaySet('smarttab')
  set smarttab
endif

set nrformats-=octal
set nrformats+=unsigned

" Make the escape key more responsive by decreasing the wait time for an
" escape sequence (e.g., arrow keys).
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

if has('reltime') && s:MaySet('incsearch')
  set incsearch
endif
" Use CTRL-L to clear the highlighting of 'hlsearch' (off by default) and call
" :diffupdate.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if s:MaySet('laststatus')
  set laststatus=2
endif
if s:MaySet('ruler')
  set ruler
endif
if s:MaySet('wildmenu')
  set wildmenu
endif

" if s:MaySet('scrolloff')
"   set scrolloff=1
" endif
if s:MaySet('sidescroll') && s:MaySet('sidescrolloff')
  set sidescroll=1
  set sidescrolloff=2
endif
set display+=lastline
if has('patch-7.4.2109')
  set display+=truncate
endif

if s:MaySet('listchars')
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Delete comment character when joining commented lines.
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" Replace the check for a tags file in the parent directory of the current
" file with a check in every ancestor directory.
if has('path_extra') && (',' . &g:tags . ',') =~# ',\./tags,'
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if s:MaySet('autoread')
  set autoread
endif

if s:MaySet('history')
  set history=1000
endif
if s:MaySet('tabpagemax')
  set tabpagemax=50
endif

" Persist g:UPPERCASE variables, used by some plugins, in .viminfo.
if !empty(&viminfo)
  set viminfo^=!
endif
" Saving options in session and view files causes more problems than it
" solves, so disable it.
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" If the running Vim lacks support for the Fish shell, use Bash instead.
if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

" Disable a legacy behavior that can break plugin maps.
if has('langmap') && exists('+langremap') && &langremap && s:MaySet('langremap')
  set nolangremap
endif

if !(exists('g:did_load_filetypes') && exists('g:did_load_ftplugin') && exists('g:did_indent_on'))
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

" From `:help :DiffOrig`.
if exists(":DiffOrig") != 2
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
    \ | diffthis | wincmd p | diffthis
endif

" Correctly highlight $() and other modern affordances in filetype=sh.
if !exists('g:is_posix') && !exists('g:is_bash') && !exists('g:is_kornshell') && !exists('g:is_dash')
  let g:is_posix = 1
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

" https://www.reddit.com/r/vim/comments/13ua4pk/weekly_vim_tips_and_tricks_thread_24/jlzj12t/
set foldopen-=block

set splitbelow
set splitright

" https://www.youtube.com/watch?v=XA2WjJbmmoM&t=2312s
set path+=**

" https://stackoverflow.com/a/23978432/16328664
set wildignorecase

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'neoclide/coc.nvim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-abolish'
call plug#end()

let g:netrw_banner = 0
let g:netrw_liststyle = 3

" https://vi.stackexchange.com/a/19369/47788
let g:tex_conceal=""

