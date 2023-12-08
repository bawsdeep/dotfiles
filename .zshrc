
neofetch

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="$HOME/.cargo/bin:$PATH"
export GPG_TTY="${TTY:-$(tty)}"
export SUDO_PROMPT="passwd: "
export TERMINAL="kitty"
export BROWSER="vivaldi"
export VISUAL="nvim"
export EDITOR="nvim"


(cat ~/.cache/wal/sequences &)

cat ~/.cache/wal/sequences

source ~/.cache/wal/colors-tty.sh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}
function _sudo_replace_buffer() {
  local old=$1 new=$2 space=${2:+ }

  # if the cursor is positioned in the $old part of the text, make
  # the substitution and leave the cursor after the $new text
  if [[ $CURSOR -le ${#old} ]]; then
    BUFFER="${new}${space}${BUFFER#$old }"
    CURSOR=${#new}
  # otherwise just replace $old with $new in the text before the cursor
  else
    LBUFFER="${new}${space}${LBUFFER#$old }"
  fi
}



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
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias c="clear"
alias ..="cd .."
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
