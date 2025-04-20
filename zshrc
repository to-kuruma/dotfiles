############################  
# 環境変数設定
############################  
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Ruby:rbenv設定
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
# eval "$(rbenv init -)"

############################  
# エイリアス設定
############################  
alias python="python3"



# TWILIO_AC_ZSH_SETUP_PATH=/Users/dev_act/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH; # twilio autocomplete setup
# TWILIO_AC_ZSH_SETUP_PATH=/Users/dev_act/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH; # twilio autocomplete setupexport PATH="/usr/local/opt/node@20/bin:$PATH"



############################  
# 外部モジュール設定
############################  

# カラー呼び出し
autoload -Uz colors && colors

## nvm
### 未インストール


## zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
fi

## zsh-autosuggestions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

## zsh-git-prompt
#source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh
source "/usr/local/opt/zsh-git-prompt/zshrc.sh"

############################  
# プロンプト設定
## old:%n@%m %1~ %#
############################  

# git_prompt() {
#   if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
#     # PROMPT="%F{034}%h%f:%F{020}%~%f $(git_super_status)"$'\n'"%# "
#     PROMPT="%F{green}%n %F{cyan}%~%f $(git_super_status)"$'\n'"%# "
#   else
#     # PROMPT="%F{034}%h%f:%F{020}%~%f "$'\n'"%# "
#     PROMPT="%F{green}%n %F{cyan}%~%f "$'\n'"%# "
#   fi
# }
git_prompt() {
  # 仮想環境名を取得（無ければ空）
  if [[ -n "$VIRTUAL_ENV" ]]; then
    venv_name="(%{$fg[yellow]%}$(basename $VIRTUAL_ENV)%{$reset_color%}) "
  else
    venv_name=""
  fi

  # Gitがワークツリー内なら表示を追加
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
    PROMPT="${venv_name}%F{green}%n %F{cyan}%~%f $(git_super_status)"$'\n'"%# "
  else
    PROMPT="${venv_name}%F{green}%n %F{cyan}%~%f"$'\n'"%# "
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{ %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[magenta]%}%{x%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[red]%}%{-%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[green]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"

precmd() {
  git_prompt
}
