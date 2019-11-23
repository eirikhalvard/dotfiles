#!/bin/bash
##################### GENERIC EXPORTS #####################
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.config/scripts
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:"/Users/Eirik/bin/FDK/Tools/osx"
export FDK_EXE="/Users/Eirik/bin/FDK/Tools/osx"

##################### CUSTOM EXPORTS ######################
export DRIVE=$HOME/Drive
export SKOLE=$DRIVE/Skole
export IN4070=$SKOLE/S7/IN4070
export IN5320=$SKOLE/S7/IN5320
export IN5290=$SKOLE/S7/IN5290
export IN2040=$SKOLE/S7/IN2040
export PROSJEKTER=$SKOLE/Prosjekter
export GITHUB=$HOME/GitHub
export SCRIPTS=$HOME/.scripts
export INIT=$HOME/config/nvim/init.vim

##################### ALIAS NAVIGATION ####################
alias 4070="cd \$IN4070"
alias 5320="cd \$IN5320"
alias 5290="cd \$IN5290"
alias 2040="cd \$IN2040"
alias forskerlinjen="cd \$FORSKERLINJEN"
alias fl="forskerlinjen"
alias prosjekter="cd \$PROSJEKTER"
alias skole="cd \$SKOLE"
alias semester="cd \SKOLE/S6"
alias github="cd \$GITHUB"
alias scripts="cd \$SCRIPTS"

##################### ALIAS COMMANDS ######################
alias ifi='ssh eirikhsa@login.ifi.uio.no'
alias c='clear'
alias popen='atom ~/.bash_profile'
alias pcat='ccat ~/.bash_profile'
alias psrc='source ~/.bash_profile'
alias hb='hub browse'
alias a='atom .'
alias o='open .'
alias sml='rlwrap sml'
alias pwdc='pwd | pbcopy'
alias maude='$HOME/.Maude-2.7.1-osx/maude'
alias scm='c && rlwrap /Applications/Racket\ v7.4/bin/plt-r5rs'
alias vim='nvim'
alias t='tmux'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tls='tmux ls'
alias -g FF='$(fzf)'
alias -g PF='| fzf'

##################### FUNCTIONS ###########################
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
 }

jc() {
  if [ "$#" -eq 0 ]; then
    javac ./*.java
  else
    javac ./*.java && java "$@"
  fi
}

mekk() {
  git add -A;
  git commit -m "$1";
  git push;
}

docs() {
  livet=$1;
  case $livet in
    p5) open https://p5js.org/reference/;;
    materialize) open http://materializecss.com/getting-started.html;;
    vue) open https://vuejs.org/v2/guide/;;
    three) open https://threejs.org/docs/;;
    ruter) open http://reisapi.ruter.no/help;;
    3331) open http://www.uio.no/studier/emner/matnat/ifi/INF3331/h18/index.html;;
    3110) open http://www.uio.no/studier/emner/matnat/math/INF3110/h18/index.html;;
    2100) open http://www.uio.no/studier/emner/matnat/ifi/INF2100/h18/index.html;;
    2010) open http://www.uio.no/studier/emner/matnat/ifi/IN2010/h18/index.html;;
    hoogle) open "https://hoogle.haskell.org/?hoogle=$2";;
    *) open "http://www.google.com/search?q=docs+$livet";;
  esac
}

function hoog() {
  open "https://hoogle.haskell.org/?hoogle=$1"
}

google() {
  argString=""
  for a in "$@"; do
    if [[ "${a:0:1}" != "-" ]] # Ignore flags (first character is -)
    then
      if [[ "$argString" != "" ]]
      then
        argString+="+" # Delimeter
      fi
      argString+="$a"
    fi
  done
  open "http://www.google.com/search?q=$argString";
}

function ghcid_script {
    case "$3" in

        "-l" | "--lines")
        eval "ghcid $1 --reload=$2 --test=':cmd readFile \"$2\" >>= pure . unlines . fmap (\x -> if null x then \"putStrLn mempty\" else x) . lines'"
        ;;

        "-c" | "--clear")
        eval "ghcid $1 --reload=$2 --test=':script $2'"
        ;;

        * )
        eval "ghcid $1 --reload='$2' --test=':cmd readFile \"$2\" >>= pure . unlines . init . concatMap (\x -> [\"putStrLn (\" ++ show x ++ \")\", \"putStr \\\"==>    \\\"\", x,\"putStrLn mempty\"]) . filter (not . null) . lines'"
        ;;
    esac
}

make-zip() {
  if [ "$#" -eq 0 ]; then
    echo "You need to specify files to zip"
    echo "Usage: make-zip [fileToZip]+"
    return
  fi
  make-zip-name eirikhsa "$@"
}

make-zip-name() {
  if [ "$#" -eq 0 ]; then
    echo "You need to specify a foldername and files to zip"
    echo "Usage: make-zip-name [foldername] [fileToZip]+"
    return
  elif [ "$#" -eq 1 ]; then
    echo "You need at least one file to zip"
    echo "Usage: make-zip-name [foldername] [fileToZip]+"
    return
  fi
  foldername=$1
  shift;
  mkdir "${foldername}";
  cp "$@" "${foldername}";
  tar -czf "${foldername}.tgz" "${foldername}";
  rm -rf "${foldername:?}";
}

untar() {
  if [ "$#" -eq 0 ]; then
    echo "You need to specify a file to untar"
    return
  else
    tar -xzf "$@"
  fi
}

################## NODE VERSION MANAGER ###################
export NVM_DIR="$HOME/.nvm"
 [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
 [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

##################### CUSTOM SCRIPTS ######################


##################### WELCOME MESSAGE #####################
clear;
echo Velkommen til terminalen Eirik!;
echo `date '+%H:%M - %d.%m.%Y'`;
echo;
