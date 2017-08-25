set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'bling/vim-airline'
Plugin 'kshenoy/vim-signature'
Plugin 'jamessan/vim-gnupg'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'othree/html5.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'wavded/vim-stylus'
call vundle#end()

syntax on
filetype plugin indent on

set number
set ruler
set autoread

set ignorecase
set hlsearch
set incsearch

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

set expandtab
set smarttab
set shiftwidth=2 tabstop=2 softtabstop=2

set backspace=indent,eol,start

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" Use command! to prevent errors on reload
command! Q q
command! WQ wq
command! W w
command! Wq wq

command! Number set number!
command! Indent set ai! si!

let mapleader=" "

nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>qq :bdelete!<CR>
nmap <Leader>d :b#<bar>bd#<CR>
nmap <Leader>w :w<CR>

nmap <Leader>r !./%

nmap <C-f> :CtrlPBuffer<cr>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

command! Reload source ~/.vimrc

let g:netrw_liststyle=3

let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>b :BuffergatorOpen<cr>

" Highlight whitespace at the end of a line
match ErrorMsg /\s\+\%#\@<!$/

au InsertEnter * match ErrorMsg /\s\+\%#\@<!$/
au InsertLeave * match ErrorMsg /\s\+$/

" Removes trailing spaces
function! TrimWhiteSpace()
      %s/\s\+$//e
endfunction
nmap <Leader>ww :call TrimWhiteSpace()<cr>

function! RubyMethodFold(line)
  let line_is_method_or_end = synIDattr(synID(a:line,1,0), 'name') == 'rubyMethodBlock'
  let line_is_def = getline(a:line) =~ '\s*def '
  return line_is_method_or_end || line_is_def
endfunction

set foldexpr=RubyMethodFold(v:lnum)

let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0

let g:ctrlp_custom_ignore = {
  \ 'dir':  '(node_modules|spec\/fixtures\/vcr_cassettes|\/tmp\/cache)$',
  \ }

" Indentation related
nmap == V=
nmap > V>
nmap < V<
