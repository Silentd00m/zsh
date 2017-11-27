#
# Options
#

source ~/.zsh/dep/antigen/antigen.zsh

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
)
DEFAULT_THEME="gears_fancy"
FALLBACK_THEME="gears_plain"

#### Do not change anything after this file

autoload -U colors && colors													# Enable colors in prompt

setopt prompt_subst
setopt extended_glob

[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

function OnLoad()
{
    case "$TERM" in
	xterm*)
	    source "$HOME/.zsh/themes/$DEFAULT_THEME".zsh
	    ;;
	*)
	    source "$HOME/.zsh/themes/$FALLBACK_THEME".zsh
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

function unzip_all() {
    find -name '*.zip' -exec sh -c 'unzip -d "${1%.*}" "$1"' _ {} \;
}

export SSH_ASKPASS=`which ksshaskpass`
export EDITOR=`which nvim`

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
