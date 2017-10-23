#
# Options
#

LOAD_MODULES=(
    "setup"
    "autocompletion"
    "syntax-highlighting"
    "history"
    "git"
    "notify"
    "command-correction"
    "regex"
)
DEFAULT_THEME="gears_plain"
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

function chpwd()
{
    __theme_OnPWD
}
function precmd()
{
    __theme_OnCMD
}

OnLoad

unset LOAD_MODULES
unset LOAD_THEME

#PATH="`ruby -rubygems -e 'puts Gem.user_dir'`/bin:$PATH"

# Setup zsh-autosuggestions
#source $HOME/.zsh/dep/zsh-autosuggestions/autosuggestions.zsh

#export TERM=xterm-256color

# Fix keyboard
#autoload zkbd; zkbd

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# Aliases
#alias cp="rsync -I --info=progress2"

#export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#export QT_QPA_PLATFORMTHEME=appmenu-qt5
# export PATH=$PATH:/home/andre/.gem/ruby/2.2.0/bin:/opt/local/bin
export SSH_ASKPASS=`which ksshaskpass`
export EDITOR=`which nvim`
alias rotate-right="xrandr --output eDP1 --rotate right"
alias rotate-left="xrandr --output eDP1 --rotate left"
alias rotate-reset="xrandr --output eDP1 --rotate normal"
