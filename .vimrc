set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim/
set tabstop=8
set number
set cc=80
"set textwidth=79
set t_Co=256
set history=200

highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
color Benokai
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set foldmethod=syntax
set foldlevel=99
set hlsearch

syntax on
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
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'

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

" SimplyFold
let g:SimpylFold_docstring_preview=1

" Autocompletion and higlight
let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all=1

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.so$', '\.o$', '\.a$']

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_depth = 100

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1

" Flake8
let no_flake8_maps = 1

" Custom commands + functions
" Mostly for C++ (Google codestyle) and Python
function SetAllSpaces()
	set expandtab ts=4 sw=4 ai
	%retab!
endfunction SetAllSpaces

" C (kernel coding style)
function SetAllTabs()
	set noexpandtab ts=8 sw=8 ai
	%retab!
endfunction SetAllTabs

command SpaceMode call SetAllSpaces()
command TabMode call SetAllTabs()


" Mappings
" ctags
nmap <F2> :TagbarToggle<CR>
nmap <F3> :ts <C-r><C-W><CR>
" NERDTree
nmap <F4> :set list!<CR>
nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :vsp<CR>
" Delete all trailing spaces
nmap <F7> :bnext<CR>
nmap <F8> :bprevious<CR>
nmap <F9> :ToggleWhitespace<CR>
nmap <F10> :%s/\s\+$//<CR>
nmap <F12> :q<CR>
nmap <space> za
map <C-c> :s/^/\/\//<Enter>
map <C-u> :s/^\/\///<Enter>
"nmap <C-o>  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"autocmd FileType python map <buffer> <C-o> :call Flake8()<CR>
"
nnoremap confr :source ~/.vimrc<CR>
