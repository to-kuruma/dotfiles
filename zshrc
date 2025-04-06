export PATH=$HOME/.nodebrew/current/bin:$PATH
eval 


TWILIO_AC_ZSH_SETUP_PATH=/Users/dev_act/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH; # twilio autocomplete setup

autoload -Uz colors && colors
alias python="python3"

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
fi

# zsh-autosuggestions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

# zsh-git-prompt
#source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh
source "/usr/local/opt/zsh-git-prompt/zshrc.sh"

# PROMPT old:%n@%m %1~ %#
PROMPT="%F{green}%n%f:%F{red}%~%f $(git_super_status)"$'\n'"%# "
eval 
TWILIO_AC_ZSH_SETUP_PATH=/Users/dev_act/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH; # twilio autocomplete setupexport PATH="/usr/local/opt/node@20/bin:$PATH"
