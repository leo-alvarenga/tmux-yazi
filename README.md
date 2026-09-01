# tmux-yazi

Open [yazi](https://yazi-rs.github.io/) in a centered floating popup.

**Requirements**: tmux ≥ 3.2 (popups), yazi on `PATH`, a set `$SHELL`.
If shell or yazi is missing, the plugin does nothing (no binding is created).

## Install

With [TPM](https://github.com/tmux-plugins/tpm) (TPM executes every `*.tmux` file in the plugin dir):

```tmux
set -g @plugin 'you/tmux-yazi'
```

or without TPM, add to `tmux.conf`:

```tmux
run '~/.config/tmux/plugins/tmux-yazi/yazi.tmux'
```

## Usage

`prefix + y` → a 60×60 floating popup centered on screen, focused, running yazi
in the current pane's directory.

The popup closes when:

- yazi exits (`q`),
- you press `Escape` or `C-c`,
- you click outside the popup.

## Options

| Option              | Default | Description                     |
| ------------------- | ------- | ------------------------------- |
| `@tmux-yazi-key`    | `y`     | prefix key that opens yazi      |
| `@tmux-yazi-width`  | `60`    | popup width in cells            |
| `@tmux-yazi-height` | `60`    | popup height in cells           |
| `@tmux-yazi-mode`   | `popup` | `popup` or `window` (see below) |

Example:

```tmux
set -g @tmux-yazi-width 80
set -g @tmux-yazi-height 40
set -g @tmux-yazi-mode window
```

## Troubleshooting

If yazi shows a **"Terminal response timeout"** inside the popup (a known issue
with yazi's image preview on some tmux/yazi versions), switch to a normal window:

```tmux
set -g @tmux-yazi-mode window
```

Window mode opens a regular (non-floating) window that closes when yazi exits; it has no auto-close on focus loss: that's popup-only.
