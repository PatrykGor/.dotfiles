# Change cursor shape for different vi modes
function zle-keumap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
       [[ $1 == 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
         [[ ${KEYMAP} == viins ]] ||
         [[ ${KEYMAP} == '' ]] ||
         [[ $1 == 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keumap-select

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char
