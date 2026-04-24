#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias code="codium"
alias codium="flatpak run com.vscodium.codium"
export OLLAMA_MODELS=$HOME/ollama-models
. "$HOME/.cargo/env"
