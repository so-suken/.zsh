#source ~/.zsh/.zplug/init.zsh 
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

#高速化
#zplug 'zsh-users/zsh-completions', use:'src/_*', lazy:true

# zplug 'mollifier/anyframe', \
#     use:'anyframe-functions/{actions,selectors,sources,widgets}/*', lazy:true

# zle -N anyframe-widget-cd-ghq-repository
# ...
# bindkey '^x^g' anyframe-widget-cd-ghq-repository
# ...

#コマンド実行時にロード
zplug 'supercrabtree/k', use:'!*'

k() {
  unfunction k
  . "${ZPLUG_REPOS}/supercrabtree/k/k.sh"

  k "$@"
}

# zplug 'simonwhitaker/gibo', use:'gibo', as:command

# zplug 'motemen/ghq', dir:"${GOPATH}/src/github.com/motemen/ghq", \
#     use:'zsh/_ghq', as:command

# compdef _ghq ghq

# ダブルクォーテーションで囲うと良い
zplug "zsh-users/zsh-history-substring-search", lazy:true

# コマンドも管理する
# グロブを受け付ける（ブレースやワイルドカードなど）
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}", lazy:true

# こんな使い方もある（他人の zshrc）
#zplug "tcnksm/docker-alias", use:zshrc

# frozen タグが設定されているとアップデートされない
zplug "k4rthik/git-cal", as:command, frozen:1

# GitHub Releases からインストールする
# また、コマンドは rename-to でリネームできる
#zplug "junegunn/fzf-bin", \
#    from:gh-r, \
#    as:command, \
#    rename-to:fzf, \
#    use:"*darwin*amd64*"

#zplug "sorin-ionescu/prezto"
#zplug "modules/command-not-found", from:prezto

# oh-my-zsh をサービスと見なして、
# そこからインストールする
#zplug "plugins/git",   from:oh-my-zsh

# if タグが true のときのみインストールされる
#zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# prezto のプラグインやテーマを使用する
#zplug "modules/osx", from:prezto, if:"[[ $OSTYPE == *darwin* ]]"
zplug "modules/git", from:prezto
zplug "modules/prompt", from:prezto
# zstyle は zplug load の前に設定する
zstyle ':prezto:module:prompt' theme 'sorin'

# インストール・アップデート後に実行されるフック
# この場合は以下のような設定が別途必要
# ZPLUG_SUDO_PASSWORD="********"
#zplug "jhawthorn/fzy", \
#    as:command, \
#    rename-to:fzy, \
#    hook-build:"make && sudo make install"

# リビジョンロック機能を持つ
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", at:4c23cb60

# Gist ファイルもインストールできる
#zplug "b4b4r07/79ee61f7c140c63d2786", \
#    from:gist, \
#    as:command, \
#    use:get_last_pane_path.sh

# bitbucket も
zplug "b4b4r07/hello_bitbucket", \
    from:bitbucket, \
    as:command, \
    use:"*.sh"

# `use` タグでキャプチャした文字列でリネームする
zplug "b4b4r07/httpstat", \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

# 依存管理
# "emoji-cli" は "jq" があるときにのみ読み込まれる
# zplug "stedolan/jq", \
#     from:gh-r, \
#     as:command, \
#     rename-to:jq
# zplug "b4b4r07/emoji-cli", \
#     on:"stedolan/jq"
# ノート: 読み込み順序を遅らせるなら defer タグを使いましょう

# 読み込み順序を設定する
# 例: "zsh-syntax-highlighting" は compinit の後に読み込まれる必要がある
# （2 以上は compinit 後に読み込まれるようになる）
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# ローカルプラグインも読み込める
# zplug "~/.zsh", from:local

# テーマファイルを読み込む
#zplug 'dracula/zsh', as:theme

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

#if [[ -s "${ZDOTDIR:-$HOME}/.zplug/repos/sorin-ionescu/prezto/modules/command-not-found/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zplug/repos/sorin-ionescu/prezto/modules/command-not-found/init.zsh"
#fi

## コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose
