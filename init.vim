call plug#begin('~/.config/nvim/plugged')
" Theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


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
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }

" Syntax
Plug 'neomake/neomake'


" Comments
Plug 'scrooloose/nerdcommenter'

call plug#end()

"
" Global Settings
"
set tabstop=4 shiftwidth=4 expandtab
set cursorline
set mouse=a

" Display Settings
set background=dark
let g:gruvbox_bold=1
colorscheme gruvbox
hi Normal ctermbg=None
let g:airline_theme='gruvbox'
let g:gruvbox_contrast_dark = "hard"


" File Extensions
au BufNewFile,BufRead *.ejs set filetype=html
filetype plugin on


set number
let g:fzf_nvim_statusline = 0
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
"
" Autocompletion
"
let g:deoplete#enable_at_startup = 1
"

" Syntax
"
let g:neomake_sh_enabled_makers = ['shellcheck']
" check syntax on write
autocmd! BufWritePost * Neomake

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
