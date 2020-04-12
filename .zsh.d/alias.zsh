#Aliases
alias a=alias
a emacs="/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs -nw"
a e="emacs"
# a ls="ls -F --color"
a gz="tar zcvf"
a ungz="tar xvfz"
#a "?=dict"
a report="sudo port -d selfupdate"
a uport='sudo port upgrade installed'
#a eman='env LANG=C man'
a ls="exa -F --group-directories-first --icons"
a l="ls -hg --group-directories-first --git --time-style long-iso"
a la='ls -a'
a ll="ls -lhg --group-directories-first --git --time-style long-iso"
a lla="ls -alhg --group-directories-first --git --time-style long-iso"
a lt="ls -T"
a es='exec zsh'
a .c="nvim ~/.zsh/.zshrc"
#a icat='/usr/local/share/imgcat'
a et='exit'
a claer='clear'
a matlab="/Applications/MATLAB_R2018b.app/bin/matlab -nodesktop -nosplash -nodisplay -r"
a BiXGBoost="caffeinate -i python bixgboost_script.py && python notify.py 1 || python notify.py" #BiXGBoost用のalias
a gnw="java -jar ~/Downloads/gnw/gnw-3.1.2b.jar -c settings.txt"
a grep="grep -rin"
a mkdir="mkdir -pv"
a sl="sl -e"
a cmat="cmatrix -s"
a makino="ssh makinosohta@192.168.0.107"
a makinoscreen="open vnc://192.168.0.107/"
a core="lstopo --of ascii"
a dirs="dirs -v"
a trete="rm -rf ~/.Trash/*"
a ps="procs -t -W 2"
a h='fc -lt '%F %T' 1'
#a weather='curl wttr.in'
a weather='() { curl wttr.in/"${1:-Tokyo}" }'
#global IP address
a myip="curl http://ipecho.net/plain; echo"
a getids="sudo arp-scan -I en0 -l"
a lg="lazygit"
a endif="fi"

#global alias
a -g pc='| pbcopy'

#suffix alias
a -s pdf='open'
a -s py='python'
a -s {gif,jpg,jpeg,png,bmp}='display'
