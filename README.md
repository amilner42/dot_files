# dotfiles

Personal config for terminal-first workflow on macOS.

## What's in here

| Path                | Lives at                  | Purpose                            |
|---------------------|---------------------------|------------------------------------|
| `zshrc`             | `~/.zshrc`                | Shell config                       |
| `zsh/`              | `~/.config/zsh/`          | `setup-elixir-ls` helper function  |
| `git/`              | `~/.config/git/`          | Git config + global ignore         |
| `helix/`            | `~/.config/helix/`        | Helix editor config + theme        |
| `ghostty/`          | `~/.config/ghostty/`      | Ghostty terminal config            |
| `yazi/`             | `~/.config/yazi/`         | Yazi file-manager config + theme   |
| `starship.toml`     | `~/.config/starship.toml` | Prompt                             |
| `tmux.conf`         | `~/.tmux.conf`            | Tmux config                        |

Machine-specific or secret config goes in `~/.zshrc.local` (not committed).

## Install on a fresh machine

Assumes Homebrew is installed and `brew shellenv` is in `~/.zprofile`.

```sh
# 1. Tools
brew install git gh helix yazi tmux asdf starship gitui
brew install --cask ghostty font-jetbrains-mono-nerd-font

# 2. Clone
gh repo clone amilner42/dot_files ~/dotfiles

# 3. Symlink
mkdir -p ~/.config
for d in zsh git helix ghostty yazi; do ln -sfn ~/dotfiles/$d ~/.config/$d; done
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/tmux.conf     ~/.tmux.conf
ln -sf ~/dotfiles/zshrc         ~/.zshrc

# 4. Yazi theme (gitignored, installed per machine)
git clone --depth 1 https://github.com/yazi-rs/flavors.git /tmp/yazi-flavors \
  && mkdir -p ~/dotfiles/yazi/flavors \
  && mv /tmp/yazi-flavors/catppuccin-mocha.yazi ~/dotfiles/yazi/flavors/ \
  && rm -rf /tmp/yazi-flavors

exec zsh
```

Move any existing `~/.config/<dir>` out of the way first, or `ln` nests the link inside it.

## Notes for future-me

- Editing happens directly in `~/dotfiles/...` — symlinks mean changes
  are live immediately. Commit when you're happy.
- The `setup-elixir-ls` function (in `zsh/elixir-ls.sh`) is per-project
  Elixir LSP setup. Run it inside any Elixir project root.
