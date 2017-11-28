ln -s ${0:a:h}/zshrc.zsh ~/.zshrc

if [ ! -e ~/.zsh ]; then
    touch ~/.zsh
fi

if [ "${0:a:h}" !=  "~/.zsh" ]; then
    ln -s ${0:a:h} ~/.zsh
fi
