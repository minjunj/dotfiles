#!/bin/bash

echo "
###################
#zsh install pahse#
###################
"

if command -v dnf >/dev/null 2>&1; then
    PACKAGE_MANAGER="dnf"
elif command -v apt-get >/dev/null 2>&1; then
    PACKAGE_MANAGER="apt-get"
else
    echo "지원하는 패키지 매니저(dnf, apt-get)가 없습니다."
    exit 1
fi

# 1. Zsh 설치
case "$PACKAGE_MANAGER" in
    dnf) sudo dnf install -y zsh ;;
    apt-get) sudo apt-get install -y zsh ;;
esac

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
git clone --branch v1.20.0 --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

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

ln -sfn $DOTFILES_DIR/zsh/.p10k.zsh ~/.p10k.zsh

echo "
##########################
#zsh plugin install pahse#
##########################
"

# zsh-autosuggestions 24.11.26
ZSH_AUTOSUGGESTIONS_COMMIT="0e810e5afa27acbd074398eefbe28d13005dbc15"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && git checkout $ZSH_AUTOSUGGESTIONS_COMMIT && cd -

# zsh-syntax-highlighting 24.11.22
ZSH_SYNTAX_HIGHLIGHTING_COMMIT="5eb677bb0fa9a3e60f0eff031dc13926e093df92"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cd zsh-syntax-highlighting && git checkout $ZSH_SYNTAX_HIGHLIGHTING_COMMIT && cd -

# Zsh를 기본 셸로 변경
chsh -s $(which zsh)

echo '
run these commonds in new zsh terminal

to set zsh-syntax-highlighting
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

apply zsh-syntax-highlighting
source ~/.zshrc
'

exec zsh
# TODO: csv파일을 보고 있는 것들만 설치하게 만들기
# TODO: csv파일을 기준으로 status를 확인하고 설치하게 만들기
