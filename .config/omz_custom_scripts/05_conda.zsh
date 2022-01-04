if [[ "$HAS_CONDA" -ne "1" ]]; then
        return 0
fi
__conda_bin="$CONDA_PATH/bin/conda"
__conda_setup="$($__conda_bin 'shell.zsh' 'hook' 2> /dev/null)"

if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_PATH/etc/profile.d/conda.sh" ]; then
        . "$CONDA_PATH/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_PATH/bin:$PATH"
    fi
fi
unset __conda_setup
unset __conda_bin

