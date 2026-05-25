#!/usr/bin/env bash
# Toggle a 2-pane horizontal tmux split between 1/3-2/3 and 50/50.
# Invoked from tmux: bind e run-shell "~/.config/tmux/toggle-tree-split.sh"

panes=$(tmux display -p '#{window_panes}')
[ "$panes" != "2" ] && exit 0

win=$(tmux display -p '#{window_width}')
left=$(tmux display -p -t '{left}' '#{pane_width}')

if [ "$left" -gt $((win * 2 / 5)) ]; then
  tmux resize-pane -t '{left}' -x $((win / 3))
else
  tmux resize-pane -t '{left}' -x $((win / 2))
fi
