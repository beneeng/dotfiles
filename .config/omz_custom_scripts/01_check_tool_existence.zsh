# check for a program

function has_tool(){
        return $(command -v $1 &> /dev/null)
}

function has_tool_var() {
    HAS_TOOL=$( has_tool $1 && { echo "1" }  || { echo "0" })
    echo $HAS_TOOL
}

HAS_TMUX=$(has_tool_var tmux)
HAS_FZF=$(has_tool_var fzf)
HAS_DIRENV=$(has_tool_var direnv)


CONDA_PATH_CANDIDATES=("/opt/anaconda3")

for p in $CONDA_PATH_CANDIDATES; do
        if [ -d "$p" ]; then
                CONDA_PATH=$p
        break
        fi
done

if ! [ -z ${CONDA_PATH+x} ]; then
    HAS_CONDA="1"
else
    HAS_CONDA="0"
fi
