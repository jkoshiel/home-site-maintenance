set fish_greeting
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/.cargo/bin

function kchain
    export SHELL=fish
    eval (keychain --eval --quiet --agents ssh $argv ~/.ssh/LocalKey)
    export SHELL=dash
end

alias ls='exa'
alias cat='bat'
alias tree='exa --tree' $argv

function hg
    history | rg $argv
end

function getlines
    git ls-files | rg "$1" | xargs wc -l
end    

starship init fish | source
