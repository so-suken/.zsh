# zshrc
export PATH="/usr/local/anaconda/bin:/opt/local/libexec/gnubin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/lib:/usr/sbin:$HOME/.cargo/bin:$PATH"
export GREP_OPTIONS='--color=auto'
setopt no_global_rcs
export FZF_DEFAULT_OPTS='--preview "bat --color=always --style=header,grid --line-range :100 {}"'
export BUCHI='94:f6:d6:12:82:56'

export ZDOTDIR="$HOME/.zsh"

#setopt
setopt IGNORE_EOF NO_CLOBBER CORRECT SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS HIST_NO_STORE HIST_IGNORE_SPACE LIST_PACKED LIST_ROWS_FIRST AUTO_CD EXTENDED_GLOB SHORT_LOOPS CDABLE_VARS AUTO_PUSHD PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS NUMERIC_GLOB_SORT MENU_COMPLETE

# autoload histry-search-end
#export CXX="/opt/local/bin/g++-5"
