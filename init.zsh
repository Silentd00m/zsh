#
# Options
#

zmodload zsh/mapfile

DEFAULT_THEME="powerlevel9k_plain"
FALLBACK_THEME="gears_plain"

#### Do not change anything after this file

if [ ! -e ~/.zsh/enabled_layers ]; then
    echo "sane-defaults
history # before autocompletion
autocompletion
syntax-highlighting
git
notify
command-correction
regex
alias-reminder
terminal-titles
auto-ls
auto-environment
python
" > ~/.zsh/enabled_layers
fi

if [ ! -e ~/.zsh/antigen ]; then
    git clone https://github.com/zsh-users/antigen ~/.zsh/antigen
fi

source ~/.zsh/antigen/antigen.zsh

autoload -U colors && colors													# Enable colors in prompt

function OnLoad()
{
    case "$TERM" in
	    xterm*)
	        source "$HOME/.zsh/themes/$DEFAULT_THEME".zsh
	        ;;
        *)
	        source "$HOME/.zsh/themes/$FALLBACK_THEME".zsh
            ;;
    esac

    __theme_Init

    for layer in ${(f)mapfile[$HOME/.zsh/enabled_layers]}; do
        if [[ $layer != "#"* ]]; then
	        source "$HOME/.zsh/layers/${${layer%%#*}// /}"
        fi
    done

    stty icrnl
}

OnLoad

unset LOAD_MODULES
unset LOAD_THEME

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

function zsh-update() {
    antigen selfupdate && antigen update
}

function unzip_all() {
    find -name '*.zip' -exec sh -c 'unzip -d "${1%.*}" "$1"' _ {} \;
}

source ~/.zsh/custom-config.zsh

antigen apply

# Emacs tramp fix
if [[ "$TERM" == "dumb" ]]
then
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
    PS1='$ '
fi
