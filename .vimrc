set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim/
set tabstop=8
set number
set cc=80
set t_Co=256
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
color Benokai
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" extra whitespaces etc
highlight ExtraWhitespace ctermbg=red

call vundle#begin('~/.vim/bundle')

" Let Vundle manage, required
Plugin 'VundleVim/Vundle.vim'

" Add or remove your Bundles here:
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'joe-skb7/cscope-maps'
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()
filetype plugin indent on

" lets brake my eyes

" Ctags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
let g:auto_ctags_filetype_mode = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#themes#molokai#palette = {}

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Mappings
" ctags
map <F3> :ts <C-r><C-W><CR>
" NERDTree
map <F4> :set list!<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :vsp<CR>
" Delete all trailing spaces
map <F7> :bnext<CR>
map <F8> :bprevious<CR>
map <F9> :ToggleWhitespace<CR>
map <F10> :%s/\s\+$//<CR>
map <F12> :q<CR>

