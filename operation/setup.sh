#!/bin/bash

echo "
###################
#zsh install pahse#
###################
"

# 1. Zsh 설치
sudo dnf install -y zsh

# 2. Oh My Zsh 설치
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "
####################
#p10k install pahse#
####################
"

# Powerlevel10k 설치
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "
######################
#symlink create phase#
######################
"

# 기존 파일 백업 및 symlink 생성
DOTFILES_DIR=~/dotfiles

# .zshrc
if [ -f ~/.zshrc ] || [ -L ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup.$(date +%s)
fi
ln -sfn $DOTFILES_DIR/zsh/.zshrc ~/.zshrc

# .p10k.zsh
if [ -f ~/.p10k.zsh ] || [ -L ~/.p10k.zsh ]; then
    mv ~/.p10k.zsh ~/.p10k.zsh.backup.$(date +%s)
fi

if [ ! -f $DOTFILES_DIR/zsh/.p10k.zsh ]; then
    touch ~/.p10k.zsh
fi
echo "
####################
#create ~/.p10k.zsh#
####################"

ln -sfn $DOTFILES_DIR/zsh/.p10k.zsh ~/.p10k.zsh

echo "Symlinks created. Please restart your terminal or run 'exec zsh' for changes to take effect."

# Zsh를 기본 셸로 변경
chsh -s $(which zsh)

exec zsh

# TODO: zsh 플러그인추가
# TODO: csv파일을 보고 있는 것들만 설치하게 만들기
# TODO: csv파일을 기준으로 status를 확인하고 설치하게 만들기