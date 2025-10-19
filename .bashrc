# run only for interactive shells
# check for i (*i*) in shell flags ($-) and exit if missing (not interactive)
[[ $- != *i* ]] && return

# rubicon
alias ll="ls -lah"
alias rsync="rsync -h --info=progress2"
alias py="python"
alias dim="~/scripts/dim_monitors.sh"
# raven-server
alias raven="ssh raven@10.0.0.10 -p 2332"
alias ld='lazydocker'
alias dc='docker compose down && docker compose up -d'
alias dd='docker compose down'

# have ranger open files with vim
export VISUAL=vim

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
