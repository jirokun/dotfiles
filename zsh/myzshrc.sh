function repos() {
  cd $REPOS/$(ls $REPOS | fzf)
}
function fzf_history() {
  CMD=`history -E 1 | fzf | cut -d " " -f 2`
  echo
  print -z $CMD
}
function fzf-history-selection() {
  BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | fzf`
  CURSOR=$#BUFFER
  zle reset-prompt
}


alias ssh="~/.dotfiles/bin/ssh-host-color-for-iterm2.sh"
alias ll="ls -lF"

zle -N fzf-history-selection
bindkey '^r' fzf-history-selection

PATH=$PATH:~/.dotfiles/bin

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# node brew
export PATH=$HOME/.nodebrew/current/bin:$PATH
