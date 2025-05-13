#!/bin/bash

CSV_FILE="$HOME/dotfiles/package/dotfiles.csv"

if command -v dnf >/dev/null 2>&1; then
    PACKAGE_MANAGER="dnf"
elif command -v apt-get >/dev/null 2>&1; then
    PACKAGE_MANAGER="apt-get"
else
    echo "지원하는 패키지 매니저(dnf, apt-get)가 없습니다."
    exit 1
fi

# 1. csv 파일의 각 줄을 읽어서
tail -n +2 "$CSV_FILE" | while IFS=',' read -r type method name path; do
    # 2. 패키지가 설치되어 있는지 확인
    if ! command -v "$name" >/dev/null 2>&1; then
        echo "$name 패키지가 설치되어 있지 않습니다. 설치를 진행합니다."
        case "$PACKAGE_MANAGER" in
            dnf) sudo dnf install -y "$name" ;;
            apt-get) sudo apt-get install -y "$name" ;;
        esac
    else
        echo "$name 패키지가 이미 설치되어 있습니다."
    fi
done
