#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export LANG=ja_JP.UTF-8
echo "Hello! (｡・ω･・｡)"

#auto init rbenv
eval "$(rbenv init -)"

#文字色
autoload colors
colors
PROMPT="%{$fg[green]%}%n %C%(!.#.$) %{$reset_color%}"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT="%{$fg[cyan]%}[%d]%{$reset_color%}"

#tab補完
autoload -U compinit
compinit
#補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#history関連
#古いコマンドと同じものは無視 
setopt hist_save_no_dups
#historyコマンドは履歴に登録しない
setopt hist_no_store
#補完時にヒストリを自動的に展開         
setopt hist_expand
#余分な空白は詰めて記録
setopt hist_reduce_blanks
#ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
#同時に起動したzshの間でヒストリを共有する
setopt share_history

#ctrl+dでzshを終了しない
setopt IGNOREEOF

#エイリアス
alias ls='ls -G'

#nodebrew
export PATH=$HOME/.nodebrew/current/bin/:$PATH
