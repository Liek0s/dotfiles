call plug#begin('$HOME/.config/nvim/bundle/')
" Theme
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" File management
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all --no-fish --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Movement
Plug 'easymotion/vim-easymotion'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Search
Plug 'scrooloose/nerdcommenter'
Plug 'eugen0329/vim-esearch'

" Syntax
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'

" Languages
Plug 'elzr/vim-json'
Plug 'martin-svk/vim-yaml'
Plug 'pangloss/vim-javascript'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" HTML/CSS
Plug 'mattn/emmet-vim'

call plug#end()
