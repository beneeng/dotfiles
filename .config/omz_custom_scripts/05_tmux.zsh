if ! has_tool tmux; then
        return 0
fi
if ! [ -z "$SSH_CONNECTION" ] &&  ! [[ $TERM == "screen-256color" ]]; then
        exec sh -c "tmux a || tmux || zsh"
fi

