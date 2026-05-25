# setup-elixir-ls: per-project ElixirLS setup for Helix (asdf-based).
# Run inside an Elixir project root. Idempotent — safe to re-run.

setup-elixir-ls() {
  emulate -L zsh
  setopt local_options err_return pipe_fail

  local project_dir="$PWD"
  local tv="$project_dir/.tool-versions"

  if [[ ! -f "$tv" ]]; then
    print -u2 "✗ No .tool-versions in $project_dir — not an asdf-managed Elixir project?"
    return 1
  fi

  local elixir_line elixir_version
  elixir_line=$(grep '^elixir ' "$tv" || true)
  if [[ -z "$elixir_line" ]]; then
    print -u2 "✗ No 'elixir <version>' line in $tv"
    return 1
  fi
  elixir_version="${elixir_line#elixir }"
  print "→ Project Elixir: $elixir_version"

  # Suggest an elixir-ls version based on the Elixir major.minor.
  local major_minor="${elixir_version%%-*}"
  major_minor="${major_minor%.*}"   # e.g. "1.14"
  local suggested
  case "$major_minor" in
    1.13)        suggested="0.17.10" ;;
    1.14)        suggested="0.20.0"  ;;
    1.15)        suggested="0.23.0"  ;;
    1.16)        suggested="0.26.4"  ;;
    1.17|1.18|1.19) suggested="0.30.0" ;;
    *)           suggested="0.30.0"  ;;
  esac

  print -n "→ Suggested elixir-ls: $suggested. Use this? [Y/n/other] "
  local answer
  read -r answer
  local els_version
  case "$answer" in
    ""|y|Y|yes) els_version="$suggested" ;;
    n|N|no)     print "✗ Aborted."; return 1 ;;
    *)          els_version="$answer" ;;
  esac
  print "→ Using elixir-ls $els_version"

  # 1. Install via asdf if not present.
  if [[ -d "$HOME/.asdf/installs/elixir-ls/$els_version" ]]; then
    print "✓ elixir-ls $els_version already installed"
  else
    print "→ Installing elixir-ls $els_version via asdf..."
    asdf install elixir-ls "$els_version"
  fi

  # 2. Apply the symlink fix (plugin bug: copies as files instead of symlinks).
  local bin_dir="$HOME/.asdf/installs/elixir-ls/$els_version/bin"
  if [[ -L "$bin_dir/elixir-ls" ]]; then
    print "✓ Symlinks already correct"
  else
    print "→ Fixing bin/ symlinks..."
    (cd "$bin_dir" && rm -f elixir-ls elixir-ls-debugger \
      && ln -s ../language_server.sh elixir-ls \
      && ln -s ../debug_adapter.sh elixir-ls-debugger)
  fi

  # 3. Pin in .tool-versions if not already pinned.
  if grep -q '^elixir-ls ' "$tv"; then
    local existing
    existing=$(grep '^elixir-ls ' "$tv" | awk '{print $2}')
    if [[ "$existing" != "$els_version" ]]; then
      print "→ Updating .tool-versions: elixir-ls $existing → $els_version"
      # Portable in-place edit for macOS sed.
      sed -i '' "s|^elixir-ls .*|elixir-ls $els_version|" "$tv"
    else
      print "✓ .tool-versions already pins elixir-ls $els_version"
    fi
  else
    print "→ Adding 'elixir-ls $els_version' to .tool-versions"
    print "elixir-ls $els_version" >> "$tv"
  fi

  # 4. Ensure Hex + rebar for this Elixir version.
  local hex_marker="$HOME/.asdf/installs/elixir/$elixir_version/.mix/archives"
  if ls "$hex_marker"/hex-* >/dev/null 2>&1; then
    print "✓ Hex already installed for Elixir $elixir_version"
  else
    print "→ Installing Hex + rebar for Elixir $elixir_version..."
    mix local.hex --force >/dev/null
    mix local.rebar --force >/dev/null
  fi

  # 5. Offer to wipe stale .elixir_ls/ cache.
  if [[ -d "$project_dir/.elixir_ls" ]]; then
    print -n "→ Existing .elixir_ls/ cache found. Wipe it? (recommended if migrating from VSCode) [y/N] "
    local wipe_answer
    read -r wipe_answer
    case "$wipe_answer" in
      y|Y|yes)
        rm -rf "$project_dir/.elixir_ls"
        print "✓ Wiped .elixir_ls/"
        ;;
      *) print "→ Keeping existing cache" ;;
    esac
  fi

  print ""
  print "✓ Setup complete. Open with: hx ."
  print "  First launch will compile + index (1–5 min). Subsequent launches are fast."
}
