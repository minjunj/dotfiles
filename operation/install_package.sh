#!/bin/bash

CSV_FILE="../package/dotfiles.csv"

# 1. csv 파일의 각 줄을 읽어서
tail -n +2 "$CSV_FILE" | while IFS=',' read -r type method name path; do
    # 2. 패키지가 설치되어 있는지 확인
    if ! command -v "$name" >/dev/null 2>&1; then
        echo "$name 패키지가 설치되어 있지 않습니다. 설치를 진행합니다."
        # 3. 설치 명령 실행 (dnf 예시, 필요시 apt 등으로 변경)
        sudo dnf install -y "$name"
    else
        echo "$name 패키지가 이미 설치되어 있습니다."
    fi
done
