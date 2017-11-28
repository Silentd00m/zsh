_ZSH_FIRSTRUN=0

if [ ! -e .zsh/ ]; then
    _ZSH_FIRSTRUN=1

    git clone https://github.com/silentd00m/zsh .zsh

    mkdir -p ~/.zsh/config
fi

if [ ! -e .zsh/config ]; then
   mkdir -p ~/.zsh/config
fi

if [ ! -e ~/.zsh/config/enabled_layers ] ; then
    echo "aliases
sane-defaults
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
" > ~/.zsh/config/enabled_layers
fi

if [ ! -e ~/.zsh/config/theme ]; then
   echo "powerlevel9k_plain" > ~/.zsh/config/theme
fi

source ~/.zsh/init.zsh

if [ $_ZSH_FIRSTRUN -eq 1 ]; then
    echo "Currently running ALL functions. Edit file: \".zsh/config/enabled_functions\" to customize."
    echo -n "Edit now? [Yn]"
    read reply < /dev/tty

    if [ $reply == "" ] || [ $reply == "y" ] || [ $reply == "Y" ]; then
        echo ""

        echo -n  "Which editor? (default vi): "
        read editor < /dev/tty

        exec $editor "~/.zsh/config/enabled_layers"
    fi
fi
