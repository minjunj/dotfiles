# filepath: /dotfiles/dotfiles/.zshrc

# Enable Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Set the Zsh theme to Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Custom settings
# Enable command auto-correction
# ENABLE_CORRECTION="true"

# Customize the prompt
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs time)

# Enable Powerlevel10k instant prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add any additional custom configurations below this line