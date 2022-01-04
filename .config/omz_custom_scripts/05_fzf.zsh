if [[ "$HAS_FZF" -ne "1" ]]; then
        return 0
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
