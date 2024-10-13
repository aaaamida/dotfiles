ZSH_THEME="refined"

plugins=(
  git
  safe-paste 
  zoxide
  zsh-interactive-cd
  direnv
)

[ -f "/home/aaaamida/.ghcup/env" ] && . "/home/aaaamida/.ghcup/env" # ghcup-env

alias ls='eza -laTL 2 --git --git-repos --icons=always --hyperlink '
alias boobs="FLAKE='/etc/nixos' nh os switch "
alias hms="FLAKE='/home/amida/.config/home-manager' nh home switch "
alias sz="source $HOME/.zshrc "
alias nzr="lvim $HOME/.zshrc "
alias aria="aria2c --log=$HOME/aria2c.log --dir=$HOME/Downloads/aria "
alias vim="lvim "
alias nvim="lvim "
alias lv="lvim "
alias lvv="fzf | xargs lvim "
alias lvw="fd . $HOME | fzf | xargs lvim "
alias lr="ranger --logfile=$HOME/ranger.log "
alias bat="bat --wrap=never --force-colorization "
alias rollback='sudo nixos-rebuild --rollback '
alias rootcfg='sudo nvim /etc/nixos/configuration.nix '
alias pkgscfg='sudo nvim /etc/nixos/nixosModules/packages.nix'
alias hibernate='systemctl hibernate '
alias nixgc='nix-collect-garbage -d '
alias reboot='sudo systemctl reboot '
alias dart='dart --disable-analytics '

function homecfg() {
  local p_PWD=$PWD
  if [ "$PWD" != "$HOME_MANAGER" ]; then
    cd "$HOME_MANAGER"
  fi
  lvim "$HOME_MANAGER/home.nix"
  cd "$p_PWD"
}

function trash() {
  for item in "$@"; do
    if [ ! -e "$item" ]; then
      echo "trash: cannot move '$item' to '$TRASH'. No such file or directory" >&2
      return 1
    elif [ ! -w "$item" ]; then
      echo "trash: cannot '$item' to '$TRASH'. Permission denied" >&2
      return 2
    else
      command mv "$1" $HOME/Trash 
    fi
  done
  return 0
}

function cargo() {
  if [ "$1" = "run" ] ||
     [ "$1" = "check" ] ||
     [ "$1" = "test" ]; then
    command cargo mommy "$@"
  else
    command cargo "$@"
  fi
}

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

export TRASH=$HOME/.trash
export XDG_CONFIG_HOME=$HOME/.config
export RUSTC_WRAPPER=sccache
export RUST_BACKTRACE=1
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'

source $HOME/.cargo/bin

# bun completions
[ -s "/home/aaaamida/.bun/_bun" ] && source "/home/aaaamida/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$HOME/Personal/bin/:$BUN_INSTALL/bin:$PATH

warp-cli connect > /dev/null
# ulimit -n 8192
echo ".zshrc reloaded"
