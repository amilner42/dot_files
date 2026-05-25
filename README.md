# dotfiles

Personal config for terminal-first workflow on macOS.

## What's in here

| Path                | Lives at                  | Purpose                            |
|---------------------|---------------------------|------------------------------------|
| `helix/`            | `~/.config/helix/`        | Helix editor config + theme        |
| `ghostty/`          | `~/.config/ghostty/`      | Ghostty terminal config            |
| `yazi/`             | `~/.config/yazi/`         | Yazi file-manager config + theme   |
| `zsh/elixir-ls.sh`  | `~/.config/zsh/`          | `setup-elixir-ls` helper function  |
| `tmux.conf`         | `~/.tmux.conf`            | Tmux config                        |
| `zshrc`             | `~/.zshrc`                | Shell config                       |

## Install on a fresh machine

```sh
# 1. Clone
git clone git@github.com:amilner42/dotfiles.git ~/dotfiles

# 2. Symlink (replace any existing files — back them up first if you care)
ln -sf ~/dotfiles/helix      ~/.config/helix
ln -sf ~/dotfiles/ghostty    ~/.config/ghostty
ln -sf ~/dotfiles/yazi       ~/.config/yazi
ln -sf ~/dotfiles/zsh        ~/.config/zsh
ln -sf ~/dotfiles/tmux.conf  ~/.tmux.conf
ln -sf ~/dotfiles/zshrc      ~/.zshrc

# 3. Install yazi theme (gitignored — installed per machine)
mkdir -p ~/.config/yazi/flavors
git clone --depth 1 https://github.com/yazi-rs/flavors.git /tmp/yazi-flavors \
  && mv /tmp/yazi-flavors/catppuccin-mocha.yazi ~/.config/yazi/flavors/ \
  && rm -rf /tmp/yazi-flavors

source ~/.zshrc
```

## Tools assumed installed

- [Helix](https://helix-editor.com/) — `brew install helix`
- [Ghostty](https://ghostty.org/) — `brew install --cask ghostty`
- [Yazi](https://yazi-rs.github.io/) — `brew install yazi`
- [Tmux](https://github.com/tmux/tmux) — `brew install tmux`
- [asdf](https://asdf-vm.com/) — `brew install asdf`
- [JetBrains Mono Nerd Font](https://www.nerdfonts.com/) —
  `brew install --cask font-jetbrains-mono-nerd-font`
- [GitHub CLI](https://cli.github.com/) — `brew install gh`
- [Yazi](https://yazi-rs.github.io/), [Gitui](https://github.com/extrawurst/gitui)

## Notes for future-me

- Editing happens directly in `~/dotfiles/...` — symlinks mean changes
  are live immediately. Commit when you're happy.
- The `setup-elixir-ls` function (in `zsh/elixir-ls.sh`) is per-project
  Elixir LSP setup. Run it inside any Elixir project root.
