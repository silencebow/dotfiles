# source this .bashrc from an existing .bashrc
# if [ -f ~/dotfiles/.bashrc ]; then
#   . ~/dotfiles/.bashrc
# fi

# run only for interactive shells
# check for i (*i*) in shell flags ($-) and exit if missing (not interactive)
[[ $- != *i* ]] && return


alias ll="ls -lah"
alias rsync="rsync -h --info=progress2"
alias py="python"

if [ $HOSTNAME = "rubicon" ]; then
  alias dim="~/scripts/dim_monitors.sh"
  alias raven="ssh raven@10.0.0.10 -p 2332"
  alias jing="ssh jing@jing-server"
elif [ $HOSTNAME = "raven-server" ]; then
  alias dc='docker compose down && docker compose up -d'
  alias dd='docker compose down'
  alias ld='lazydocker'
elif [ $HOSTNAME = "jing-server" ]; then
  alias dc='docker compose down && docker compose up -d'
  alias dd='docker compose down'
fi


# create a tmux session "0" or attach if existing
# only if tmux exists and not in tmux or ssh
if command -v tmux >/dev/null 2>&1; then
  if [ ! "$TERM_PROGRAM" = tmux ]; then
    if [ ! -n "$SSH_CONNECTION" ]; then
      tmux new -As0
      # tmux a || tmux
    fi
  fi
fi


# run fastfetch if it exists
if command -v fastfetch >/dev/null 2>&1; then
  fastfetch
fi

