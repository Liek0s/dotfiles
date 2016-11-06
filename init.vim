call plug#begin('~/.config/nvim/plugged')
" Theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

" Movement
Plug 'easymotion/vim-easymotion'

" File management
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/utils/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" HTML/CSS
Plug 'mattn/emmet-vim'

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi' " Python2 & 3 autcompletion
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " Javascript autocompletion

" Comments
Plug 'scrooloose/nerdcommenter'

call plug#end()

"
" Global Settings
"
set tabstop=4 shiftwidth=4 expandtab
set cursorline

" File Extensions
au BufNewFile,BufRead *.ejs set filetype=html
filetype plugin on


"
" Display Settings
"
let g:gruvbox_contrast_dark = "hard"
set background=dark
colorscheme gruvbox

set number
let g:fzf_nvim_statusline = 0 
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" 
" Autocompletion
"
let g:deoplete#enable_at_startup = 1

" NERDCommenter
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" 
" Keybindings
" Leader = Spacebar
"
let mapleader = "\<Space>"

" Disable arrow keys because im hardcore
nmap <up>    <nop>
nmap <down>  <nop>
nmap <left>  <nop>
nmap <right> <nop>

" Switching Windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Easymotion keybindings
map /           <Plug>(easymotion-sn)
map <Leader>j   <Plug>(easymotion-j)
map <Leader>k   <Plug>(easymotion-k)
map <Leader>l   <Plug>(easymotion-lineforward)
map <Leader>h   <Plug>(easymotion-linebackward)
map w           <Plug>(easymotion-bd-wl)

" FZF Bindings
nnoremap <silent>   <C-p> :Files<CR>
nnoremap <silent>   <C-b> :Buffers<CR>

" NERDTree
map <Leader>l       :NERDTreeToggle<CR>
