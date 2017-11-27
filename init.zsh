#
# Options
#

if [ ! -e ~/.zsh/antigen ]; then
    git clone https://github.com/zsh-users/antigen ~/.zsh/antigen
fi

source ~/.zsh/antigen/antigen.zsh

LOAD_MODULES=(
    "sane-defaults"
    "history"
    "autocompletion"
    "syntax-highlighting"
    "git"
    "notify"
    "command-correction"
    "regex"
    "alias-reminder"
    "terminal-titles"
    "auto-ls"
    "auto-environment"
    "python"
)
DEFAULT_THEME="powerlevel9k_plain"
FALLBACK_THEME="gears_plain"

#### Do not change anything after this file

autoload -U colors && colors													# Enable colors in prompt

# setopt prompt_subst
# setopt extended_glob

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

    for module in $LOAD_MODULES; do
	    source "$HOME/.zsh/functions/$module"
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
