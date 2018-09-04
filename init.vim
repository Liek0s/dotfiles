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

" Syntax
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
Plug 'elzr/vim-json'

" Comments
Plug 'scrooloose/nerdcommenter'

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" HTML/CSS
Plug 'mattn/emmet-vim'

" YAML
Plug 'martin-svk/vim-yaml'

"CSV
Plug 'chrisbra/csv.vim'

" JS
Plug 'othree/yajs.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'posva/vim-vue'
" Plug 'JavaScript-Indent'

" Python
Plug 'zchee/deoplete-jedi'
Plug 'tmhedberg/SimpylFold'
Plug 'tweekmonster/braceless.vim'

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
colorscheme gruvbox
hi Normal ctermbg=None
let g:airline_theme='gruvbox'
let g:gruvbox_bold = 1
let g:gruvbox_underline = 1
let g:gruvbox_italics = 1
" hi Normal ctermbg=None
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
let g:EasyMotion_smartcase = 1
let g:EasyMotion_off_screen_search = 0
nmap ; <Plug>(easymotion-s2)

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

" Vimwiki
let g:vimwiki_list = [{'path': '$HOME/.wiki/'}]


hi Search cterm=bold ctermfg=40 ctermbg=NONE
"
" Autocompletion
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose

" NERDCommenter
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" Syntax
" check syntax on write
autocmd! BufWritePost * Neomake
" let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 240

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

autocmd FileType json set ts=2 sw=2

" ################################
" Javascript
" ################################
autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab
autocmd FileType vue set tabstop=2 shiftwidth=2 expandtab
let g:neomake_javascript_enabled_makers = ['eslint']

let g:vue_disable_pre_processors=1

" ################################
" Python
" ################################
autocmd FileType python BracelessEnable +indent +fold +highlight-cc
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
    \ 'args':
    \ ['--max-line-length=80', '--ignore=E115,E266,E123,E126,E128'],
    \ }

" ##################################
" Bash
" ##################################
let g:neomake_sh_enabled_makers = ['shellcheck']

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

" Easymotion keybindings
" map /           <Plug>(easymotion-sn)
map <Leader>j   <Plug>(easymotion-j)
map <Leader>k   <Plug>(easymotion-k)
map <Leader>l   <Plug>(easymotion-lineforward)
map <Leader>h   <Plug>(easymotion-linebackward)
map w           <Plug>(easymotion-bd-wl)

" Copy / Paste to xclip
map <Leader>y "*y
map <Leader>p "*p

" FZF Bindings
nnoremap <silent>   /           :Lines<CR>
nnoremap <silent>   <C-p>       :Files<CR>
nnoremap <silent>   <C-b>       :Buffers<CR>
nnoremap <silent>   <leader>c   :Commits<CR> 
nnoremap <silent>   <leader>h   :History<CR> 

" NERDTree
map <Leader>l       :NERDTreeToggle<CR>
 
" Tagbar
map <Leader>t       :TagbarToggle<CR>
