# filepath: /dotfiles/dotfiles/.zshrc

# Enable Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Set the Zsh theme to Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(git zsh-autosuggestions)

# Enable Powerlevel10k instant prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# inject aliases
[ -f ~/dotfiles/zsh/aliases.zsh ] && source ~/dotfiles/zsh/aliases.zsh
