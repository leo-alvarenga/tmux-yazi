#!/usr/bin/env bash

# tmux-yazi: open yazi in a centered floating popup (tmux >= 3.2);
# Safe to run on every config load (bindings are simply overwritten).

# Do nothing unless both a shell and yazi exist.
[ -n "$SHELL" ] || exit 0

command -v yazi >/dev/null 2>&1 || exit 0

opt() {
	tmux show-option -gqv "$1" 2>/dev/null;
}

key="$(opt @tmux-yazi-key)"
key="${key:-y}"


width="$(opt @tmux-yazi-width)"
width="${width:-60}"


height="$(opt @tmux-yazi-height)"
height="${height:-60}"


mode="$(opt @tmux-yazi-mode)"
mode="${mode:-popup}"

# Fall back to a normal window where popups don't exist (tmux < 3.2).
tmux_version="$(tmux -V | sed -E 's/.*([0-9]+)\.([0-9]+).*/\1\2/')"
[ "${tmux_version:-0}" -lt 32 ] && mode="window"

if [ "$mode" = "window" ]; then
	tmux bind-key "$key" run-shell 'tmux new-window "yazi; exit"'
else
	tmux bind-key "$key" run-shell "tmux display-popup -w $width -h $height -x C -y C -E 'yazi; exit'"
fi
