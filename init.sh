

init_tmux() {

    TMUX_CONF="$HOME/.tmux.conf"
    TMUX_CONF_DIR="$HOME/.tmux"

    [ ! -f "$TMUX_CONF_DIR" ] && mkdir -pv "$TMUX_CONF_DIR/plugins"

    git clone "https://github.com/tmux-plugins/tpm.git" "$TMUX_CONF_DIR/plugins/tpm"
}

init_tmux


