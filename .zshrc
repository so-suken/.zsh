
#zshの読み込みファイル
ZSHHOME="${HOME}/.zsh/.zsh.d"

echo "BEFORE"
echo $PATH


if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
      echo "loaded"
      echo $i
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

#historyの保存
SAVEHIST=100000
HISTFILE=~/.zhistory

#manコマンドの日本語化
MANPATH=/usr/local/share/man/ja_JP.UTF-8:/usr/share/man/ja:/usr/share/man
export MANPATH

# fzf導入時に記入
_has() {
    return $( whence $1 &>/dev/null )
    }

#auto englishate
#autoload -Uz add-zsh-hook


#function force-alphanumeric {
#  case "${OSTYPE}" in
#  darwin*)
    # 「英数」キーを押す
    # 若干重いので サブシェル + バックグラウンド で実行する
#    ( osascript -e 'tell application "System Events" to key code {102}' & )
#  esac
#}

#add-zsh-hook precmd force-alphanumeric

#強力な補完
#autoload -U compinit
#compinit -u

#要らないかもしれないzstyle達
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

#大文字小文字の区別をなくす(補完)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#ファイルに色を付ける(補完)
eval `dircolors`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

  #補完候補のハイライト
zstyle ':completion:*:default' menu select=2

  # セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

setopt complete_in_word      # 語の途中でもカーソル位置で補完
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示
  
#cdpathの指定
cdpath=(~ /)

#補完の候補絞り(オブジェクトファイルとバックアップファイルの除外)
fignore=(.o \~)

#補完関数の指定
compdef _icat icat

#補完の最大表示数を10以下に
LISTMAX=10

fpath=(~/func $fpath)
autoload ${fpath[1]}/*(:t)

PERIOD=1200

#mail
MAILPATH="var/mail/$USER?${fg[magenta]}You have new mail."
#mailのチェック頻度
MAILCHECK=20

#login,logout
watch=(not me)#全員ならall
LOGCHECK=20
WATCHFMT="%(a:Hello %n [%m] [%t]:Bye %n [%m] [%t])"

# a#jobs
setopt AUTO_RESUME

# pyenv + pyenv-virtualenv 設定
#if command -v pyenv >/dev/null; then eval "$(pyenv init -)"; fi 
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

echo "AFTER"
echo $PATH
# history-search-end
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
# export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

#zshplog
# export ZPLUG_HOME=~/.zplug

#文字の色をピンク色に
#PS1='%F{13}Mac%Sino%s%f%F{10}[%(5~,%-1~/.../%2~,%~)]%f %F{231}%#%f '
#PS1=' %F{13}Mac%Sino%s%f %F{231}%#%f '
PS1='%F{230}%# %f%F{003}>%f%F{124}<>%f%F{143}>>%f '

#ターミナルの右側に日付・時間表示
#RPS1='%F{7}%@%f'


elatexmk() {
   if [ $# -lt 1 ]; then
     echo "Usage: $0 tex_file"
     echo "Call latexmk with pdflatex. This function might be useful when you want to typeset TeX files in English."
   else
     latexmk -pvc -pdf -pdflatex="pdflatex -interaction=nonstopmode" $1
   fi
 }



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#manに色付け
# export MANPAGER="bat -l man -p"

#: "cd先のディレクトリのファイル一覧を表示する" && {
#  [ -z "$ENHANCD_ROOT" ] && function chpwd { l } # enhancdがない場合
#  [ -z "$ENHANCD_ROOT" ] || export ENHANCD_HOOK_AFTER_CD="lt" # enhancdがあるときはそのHook機構を使う
#}


test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh" || true

export JAVA_HOME=`/usr/libexec/java_home -v 17.0.2, x86_64`
PATH=$JAVA_HOME/bin:$PATH
