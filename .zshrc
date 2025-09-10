export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined"

plugins=(
        sudo
	git
	safe-paste
	zoxide
	zsh-interactive-cd
	direnv
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export TMUX_SOURCE=$HOME/.config/tmux/tmux.conf
export XDG_CONFIG_HOME=$HOME/.config
export RUSTC_WRAPPER=sccache
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
export EDITOR=$(which nvim)
export HISTDUP=erase
export RSYNC_HOST="shrine"

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

alias icat='kitten icat '
alias cd='z '
alias wa='nchat '
alias bcord='~/Personal/BetterDiscord-Linux.AppImage '
alias lv='lvim '
alias nv='nvim '
alias snv='nv -u ~/.config/kvim/init.lua '
alias lvc='lvim $LV_CONF '
alias nvc='nvim $NV_CONF '
alias lvz="lvim $HOME/.zshrc "
alias nvz="nvim $HOME/.zshrc "
alias nv='nvim '
alias sz="source $HOME/.zshrc "
alias aria="aria2c --log=$HOME/aria2c.log --dir=$HOME/Downloads/aria "
alias lr="y "
alias bat="bat --wrap=never --force-colorization "
alias hibernate='systemctl hibernate '
alias reboot='sudo systemctl reboot '
alias poweroff='sudo systemctl poweroff '
alias dart='dart --disable-analytics '
alias pac='paru --skipreview --topdown --cleanafter --sudoloop '
alias boobs='pac -S '
alias tmsrc="tmux source $TMUX_SOURCE "
alias cls='clear '
alias ls='eza -laTL 2 --git --git-repos --icons=always --hyperlink '
alias mts="cmatrix -abfu 2 -C magenta"
alias nhm="nvim $XDG_CONFIG_HOME/home-manager/home.nix "
alias cat="bat "
alias speedtest="speedtest-rs "
alias hm='home-manager '
alias hms='home-manager switch '
alias etime='ps -eo pid,comm,lstart,etime,args '

function start_libvirt() {
        sudo systemctl start libvirtd
        sudo virsh net-start default
}

function stop_libvirt() {
        sudo virsh net-destroy default
        sudo systemctl stop libvirtd.socket
        sudo systemctl stop libvirtd-ro.socket
        sudo systemctl stop libvirtd-admin.socket
        sudo systemctl stop libvirtd.service
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# function freeze() {
#         app=/bin/"$1"
#         sudo chmod -x $app
#         sudo chattr +i $app
# }
#
# function unfreeze() {
#         app=/bin/"$1"
#         sudo chattr -i $app
#         sudo chmod +x $app
# }

function cargo() {
        if [ "$1" = "run" ] ||
         [ "$1" = "check" ] ||
         [ "$1" = "test" ]; then
                command cargo mommy "$@"
        else
                command cargo "$@"
        fi
}

function timer() {
        sleep "$1"
        notify-send "$2"
}

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
eval "$(fzf --zsh)"

warp-cli connect > /dev/null
