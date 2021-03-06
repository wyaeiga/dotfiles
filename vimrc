set nocompatible
set backspace=2
filetype off
let mapleader = ","

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Functionality
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'thoughtbot/vim-rspec'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'lilydjwg/colorizer'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-endwise'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'

" Syntax
Plugin 'slim-template/vim-slim.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'vim-ruby/vim-ruby'
Plugin 'leshill/vim-json'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'mxw/vim-jsx'

call vundle#end()
filetype plugin indent on
syntax on

" NERDTreeToggle
map <Leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Vim readability
set nu
set hlsearch
set nowrap

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Clipboard stuff
set clipboard=unnamed

" Airline displayed by default
set laststatus=2

" Making GitGutter look better
highlight clear SignColumn
set signcolumn=yes

" 80 character column marker
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="100"

function! AirlineInit()
  let g:airline_section_b = airline#section#create(['%{strftime("%A, %b %d | %I:%M %p")}'])
  let g:airline_section_c = airline#section#create(['hunks','%F'])
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
endfunction
autocmd VimEnter * call AirlineInit()

function! MarkWindowSwap()
  let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
  "Mark destination
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"
  "Switch to source and shuffle dest->source
  let markedBuf = bufnr( "%" )
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' curBuf
  "Switch to dest and shuffle source->dest
  exe curNum . "wincmd w"
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>m :call MarkWindowSwap()<CR>
nmap <silent> <leader>p :call DoWindowSwap()<CR>

" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"

" tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap <silent> ,f <C-]>
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>
