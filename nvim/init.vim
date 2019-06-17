" Install vim-plug to manage plugins
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim 
                \ --create-dirs 
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

execute 'source' '$HOME/.config/nvim/vimrc/main.vim'
