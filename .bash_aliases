 #### ea - alias for editing aliases
 #
 #When setting up a new aliases file, or having creating a new file.. About every time after editing an aliases file, I source it. This alias makes editing alias a
 #bit easier and they are useful right away. Note if the source failed, it will not echo "aliases sourced".
 #
 #Sub in gedit for your favorite editor, or alter for ksh, sh, etc.
 #
 alias ea='vim ~/.bash_aliases; source ~/.bash_aliases && source $HOME/.bash_aliases && echo "aliases sourced  --ok."'
 #
 #### vscode - alias for launching vscode
 alias code='code .'
 ### update and upgrade
 alias update='sudo apt-get update -y && sudo apt-get upgrade'
 #### nmap - alias for nmap
 alias nmap='/c/NMAP/./nmap.exe'
 #ll for ls -al
 alias ll='ls -al'
 #go to git repo for Go
 alias gg='cd /home/mrod/go/src/github.td.teradata.com/Application-Security/'
 #go to public github folder
 alias ggp='cd /home/mrod/go/src/github.com/'
 #alias git remote show origin
 alias grso='git remote show origin'
 #alias git flow feature start
 alias gffs='git flow feature start'
 #alias git flow feature publish
 alias gffp='git flow feature publish'
 #git checkout
 alias checkout='git checkout'
 #git pull
 alias gp='git pull'
 #git status
 alias status='git status'
 # git commit
 alias gc='git commit -m'
 #cd to windows downloads folder
 alias dl='cd  /c/Users/mr186081/Downloads'
 #launch local version of godocs on port 8888
 alias gdl='godoc -http=:8888'
 #launch vim 
 alias vi='vim'
 #clear screen
 alias cls='clear'
 #listening ports
 alias lports='netstat -ant | grep LISTEN'
 #get external IP
 alias myip='curl http://ipinfo.io/ip'
 #git fetch --prune
 alias gfp='git fetch --prune'
 #open python3
 alias p3='python3'
 #cd to dictionary files
 alias dict='cd /usr/share/dict'
 # clears aws profile
 alias clearprofile='export AWS_PROFILE='
 # activeate python venv
 alias pyenv='python3 -m .venv env && source .venv/bin/activate'
 # fix time if laptop was put to sleep
 alias fixtime='sudo hwclock -s'
 # untar
 alias untar='tar -xvf'
 # cd to windows home
 alias whome='cd /c/Users/mr186081'
 # last branch
# function lb() {
#   git reflog show --pretty=format:'%gs ~ %gd' --date=relative | grep 'checkout:' | grep -oE '[^ ]+ ~ .*' | awk -F~ '!seen[$1]++' | head -n 10 | awk -F' ~ HEAD@{' '{printf(\"  \\033[33m%s: \\033[37m %s\\033[0m\\n\", substr($2, 1, length($2)-1), $1)}
# }
 # function to check when ssl cert expires
 function checkexpire() {
  echo | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -noout -dates
 }
 
 #open git repo in the browser the -b switch opens the specific branch
 #alias ghb='gh -b'
 #
 #function gh {
#	   if [[ -x "$(command -v open)" ]]; then
#		       cmd=open
#		         elif [[ -x "$(command -v xdg-open)" ]]; then
#				     cmd=xdg-open
#				       fi
