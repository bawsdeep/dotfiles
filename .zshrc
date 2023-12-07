
neofetch

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH="${PATH}:${HOME}/.local/bin/"

(cat ~/.cache/wal/sequences &)

cat ~/.cache/wal/sequences

source ~/.cache/wal/colors-tty.sh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias hrc="nvim ${HOME}/.config/hypr/hyprland.conf"
alias wrc="nvim ${HOME}/.config/waybar"
alias zrc="nvim ${HOME}/.zshrc"
alias krc="nvim ${HOME}/.config/kitty/kitty.conf"
alias v="nvim"
alias notes="micro ${HOME}/Desktop/notes"
alias ls="eza -Fal --icons --group-directories-first"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
