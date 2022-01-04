if [[ "$HAS_DIRENV" -ne "1" ]]; then
        return 0
fi
eval "$(direnv hook zsh)"
