
# Environment variables
export XDG_CONFIG_HOME=~/.config

# Antigen (github.com/zsh-users/antigen)
if [ ! -f ${XDG_CONFIG_HOME}/zsh/antigen.zsh ]; then
    echo "Installing Antigen to ${XDG_CONFIG_HOME}/zsh..."
    mkdir -p ${XDG_CONFIG_HOME}/zsh
    curl -L git.io/antigen > ${XDG_CONFIG_HOME}/zsh/antigen.zsh
fi
ADOTDIR=${XDG_CONFIG_HOME}/zsh/antigen
source ${XDG_CONFIG_HOME}/zsh/antigen.zsh

# Nerd Fonts (github.com/ryanoasis/nerd-fonts)
if ! $(fc-list | grep -q NerdFont); then
    FONT_DIR=${HOME}/.local/share/fonts/NerdFont
    printf "Installing NerdFonts to ${FONT_DIR}..."
    mkdir -p ${FONT_DIR}
    curl https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Inconsolata/complete/Inconsolata%20for%20Powerline%20Nerd%20Font%20Complete%20Mono.otf > ${FONT_DIR} && fc-cache -vf ${FONT_DIR}
    printf "Setting Pantheon Terminal font to NerdFont..."
    gsettings set org.pantheon.terminal.settings font "InconsolataForPowerline Nerd Font 15" 
fi

# Powerline theme (github.com/bhilburn/powerlevel9k)
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
antigen theme bhilburn/powerlevel9k powerlevel9k

# Cool plugins
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle djui/alias-tips

# Oh My Zsh
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle debian
antigen bundle git
antigen bundle heroku
antigen bundle python
antigen bundle pylint

antigen apply

# Options
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
unsetopt LIST_AMBIGUOUS
setopt AUTO_LIST
setopt COMPLETE_ALIASES
setopt LIST_ROWS_FIRST
setopt LIST_TYPES
setopt CORRECT
setopt AUTO_CD
export CLICOLOR=1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B---------------------%b"
zstyle ':completion:*:messages' format '%~'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
autoload -U compinit && compinit

# Aliases
alias ls="ls -AF --group-directories-first --color=auto"
