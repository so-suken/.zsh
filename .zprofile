#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

echo "loading zprofile"

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='emacs'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

export PATH="$HOME/.cargo/bin:$PATH"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
#export PATH=$PYENV_ROOT/bin:/opt/local/libexec/gnubin:/opt/local/bin:/usr/local/bin:/opt/local/sbin:/usr/local/lib:$PATH
#export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#export PATH="$PATH:/Users/makino/.local/bin"
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"

#文字の色をピンク色に
#PS1='%F{13}Mac%Sino%s%f%F{10}[%(5~,%-1~/.../%2~,%~)]%f %F{231}%#%f '
#PS1=' %F{13}Mac%Sino%s%f %F{231}%#%f '

#ターミナルの右側に日付・時間表示
#RPS1='%F{7}%@%f'
#homebrew
export PATH=$HOME/.homebrew/bin:$PATH
export HOMEBREW_CACHE=$HOME/.homebrew/cache

# Added by Toolbox App
export PATH="$PATH:/Users/makino/Library/Application Support/JetBrains/Toolbox/scripts"
echo "PATH AFTER ZPROFILE"
echo $PATH
