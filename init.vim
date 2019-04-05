call plug#begin('~/.config/nvim/plugged')
" Theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Movement
Plug 'easymotion/vim-easymotion'
Plug 'aykamko/vim-easymotion-segments'

" File management
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all --no-fish --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Search
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'eugen0329/vim-esearch'

" Syntax
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
Plug 'elzr/vim-json'
Plug 'martin-svk/vim-yaml'
Plug 'pangloss/vim-javascript'
Plug 'chrisbra/csv.vim'

" Comments
Plug 'scrooloose/nerdcommenter'

" Autocompletion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" HTML/CSS
Plug 'mattn/emmet-vim'

call plug#end()

"
" Global Settings
"
set nocompatible
filetype plugin on
set tabstop=4 shiftwidth=4 expandtab
set cursorline
set mouse=a

" Display Settings

set background=dark
colorscheme gruvbox
hi Normal ctermbg=None
let g:airline_theme='gruvbox'
let g:gruvbox_bold = 1
let g:gruvbox_underline = 1
let g:gruvbox_italics = 1
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_hls_cursor = 'yellow'
let g:gruvbox_invert_selection = 0
let g:airline_theme='gruvbox'
colorscheme gruvbox
set background=dark
set number
let g:fzf_nvim_statusline = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0

" #############################
" Utils
" #############################

let g:EasyMotion_do_mapping = 0
" let g:EasyMotion_smartcase = 1
let g:EasyMotion_off_screen_search = 0

" set nohlsearch
let g:incsearch#auto_nohlsearch = 1

let g:esearch = {
    \ 'adapter':    'ag',
    \ 'backend':    'nvim',
    \ 'out':        'win',
    \ 'batch_size': 1000,
    \ 'use':        ['visual', 'hlsearch', 'last'],
    \}

"
" File Extensions
let g:rooter_patterns = ['.root', '.git', '.git/']

filetype plugin on

hi Search cterm=bold ctermfg=44 ctermbg=NONE

" NERDCommenter
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" Syntax
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ##################################
" ALE
" ##################################
let g:ale_set_highlights = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
    \ 'yaml': []
    \ }

let g:ale_linters_ignore = {
    \ 'yaml': ['swaglint']
    \ }



" ################################
" Javascript
" ################################
let g:javascript_plugin_flow = 1

autocmd FileType json set ts=2 sw=2
autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab

" ################################
" Python
" ################################
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

call esearch#map('<leader>ff', 'esearch')


" ##################################
" Keybindings
" ##################################
" Leader = Spacebar
let mapleader = "\<Space>"

" Disable arrow keys
nmap <up>    <nop>
nmap <down>  <nop>
nmap <left>  <nop>
nmap <right> <nop>

" Switching Windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map /   <Plug>(incsearch-forward)
map ?   <Plug>(incsearch-backward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)

nnoremap    <esc><esc>  :silent!    nohls<cr>

" Easymotion keybindings
" map /           <Plug>(easymotion-sn)
nmap    <Leader>;   <Plug>(easymotion-s2)
map     <Leader>f   <Plug>(easymotion-bd-f)
nmap    <Leader>f   <Plug>(easymotion-overwin-f)
nmap    <Leader>s   <Plug>(easymotion-overwin-f2)

map     <Leader>L   <Plug>(easymotion-bd-jk)
nmap    <Leader>L   <Plug>(easymotion-overwin-line)

map     <Leader>j   <Plug>(easymotion-j)
map     <Leader>k   <Plug>(easymotion-k)
map     <Leader>l   <Plug>(easymotion-lineforward)
map     <Leader>h   <Plug>(easymotion-linebackward)
map     w           <Plug>(easymotion-bd-wl)

" Copy / Paste to xclip
map     <Leader>y   "*y
map     <Leader>p   "*p

" FZF Bindings
"
nnoremap <silent>   <C-p>       :Files<CR>
nnoremap <silent>   <C-b>       :Buffers<CR>
nnoremap <silent>   <leader>c   :Commits<CR> 
nnoremap <silent>   <leader>h   :History<CR> 

" NERDTree
map <Leader>l       :NERDTreeToggle<CR>
