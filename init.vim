call plug#begin('~/.config/nvim/plugged')
" Theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Movement
Plug 'easymotion/vim-easymotion'
Plug 'bkad/CamelCaseMotion'

" File management
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all --no-fish --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Search
Plug 'eugen0329/vim-esearch'
Plug 'majutsushi/tagbar'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" HTML/CSS
Plug 'mattn/emmet-vim'

" JS
Plug 'jelera/vim-javascript-syntax'
" Plug 'JavaScript-Indent'

" Python
Plug 'zchee/deoplete-jedi'
Plug 'tweekmonster/braceless.vim'
Plug 'tmhedberg/SimpylFold'

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }


" Syntax
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'

" Comments
Plug 'scrooloose/nerdcommenter'

" VimWiki
Plug 'vimwiki/vimwiki'

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
let g:gruvbox_bold=1
colorscheme gruvbox
hi Normal ctermbg=None
let g:airline_theme='gruvbox'
let g:gruvbox_contrast_dark = 'hard'

set number
let g:fzf_nvim_statusline = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0

"
" File Extensions
filetype plugin on
au BufNewFile,BufRead *.ejs set filetype=html

let g:esearch = {
    \ 'adapter':    'ag',
    \ 'backend':    'nvim',
    \ 'out':        'win',
    \ 'batch_size': 1000,
    \ 'use':        ['visual', 'hlsearch', 'last'],
    \}

let g:rooter_patterns = ['.root', '.git', '.git/']

hi Search cterm=bold ctermfg=40 ctermbg=NONE
"
" Autocompletion
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose

" Syntax
" check syntax on write
autocmd! BufWritePost * Neomake
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Javascript
autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab

" Python
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
    \ 'args':
    \ ['--max-line-length=80', '--ignore=E115,E266,E123,E126,E128'],
    \ }
autocmd FileType python BracelessEnable +indent +fold +highlight-cc

" NERDCommenter
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

"
" VimWiki
let g:vimwiki_list = [
    \ {'path': '~/workspace/.vimwiki/coog.wiki'},
    \ ]

au BufRead,BufNewFile *.wiki set filetype=vimwiki

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
" call camelcasemotion#CreateMotionMappings('<leader>')
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge
map <Leader>y "*y
map <Leader>p "*p

" FZF Bindings
nnoremap <silent>   <C-p> :Files<CR>
nnoremap <silent>   <C-b> :Buffers<CR>

" NERDTree
map <Leader>l       :NERDTreeToggle<CR>
" Tagbar
map <Leader>t       :TagbarToggle<CR>
