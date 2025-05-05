# dotfiles 폴더 구조 및 파일 설명

이 저장소는 Zsh 환경 설정을 위한 dotfiles를 관리합니다. 각 폴더와 파일의 역할은 다음과 같습니다.

## 폴더 및 파일 설명

# zsh
- **.zshrc**  
  Zsh 셸의 기본 설정 파일입니다. 플러그인, 테마, 환경 변수, alias 등 Zsh 환경을 설정합니다.  
  Oh My Zsh와 Powerlevel10k 테마를 사용할 수 있도록 구성되어 있습니다.

- **.p10k.zsh**  
  Powerlevel10k 프롬프트 테마의 설정 파일입니다. 프롬프트의 모양, 색상, 아이콘 등을 세부적으로 커스터마이즈할 수 있습니다.

# operation
- **setup.sh**  
  Zsh, Oh My Zsh, Powerlevel10k 설치 및 dotfiles 심볼릭 링크 생성을 자동화하는 설치 스크립트입니다.

- **README.md**  
  이 저장소와 각 파일의 역할, 설치 방법 등을 안내하는 문서입니다.

---

## 사용 방법

1. 저장소를 클론합니다.
2. `setup.sh` 스크립트를 실행하여 환경을 자동으로 설정합니다.
```bash
   chmod +x ./operation/setup.sh
   ./operation/setup.sh
   ```
3. 터미널을 재시작하거나 `exec zsh` 명령어로 Zsh 환경을 적용합니다.
