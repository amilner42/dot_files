cdgit='cd ~/Desktop/programming/git'

# Per-project Helix + ElixirLS setup helper (provides `setup-elixir-ls`)
source ~/.config/zsh/elixir-ls.sh

# Default editor (git commit, crontab, etc.)
export EDITOR=hx
export VISUAL=hx

alias f='yazi'
alias sourcebash='source ~/.zshrc'
alias hxbash='hx ~/.zshrc'
alias cdd='cd ~/Desktop/programming/git/fluency_track'
alias cdverb='cd ~/Desktop/programming/git/verb_map'
alias cd.ave.api='cd ~/Desktop/programming/git/aveline'
alias cd.ave.client='cd ~/Desktop/programming/git/aveline-client'
alias cd.oskol='cd ~/Desktop/programming/git/oskol'
alias cd.oskol.worktrees='cd /Users/amilner42/Desktop/programming/git/worktrees/oskol'
alias cd.oskol.tree1='cd.oskol.worktrees; cd tree1;'
alias cd.oskol.tree2='cd.oskol.worktrees; cd tree2;'
alias cd.oskol.tree3='cd.oskol.worktrees; cd tree3;'
alias cd.oskol.tree4='cd.oskol.worktrees; cd tree4;'
alias cd.oskol.tree5='cd.oskol.worktrees; cd tree5;'

alias cd4='cd /Users/amilner42/Desktop/programming/git/idea-400cals'
alias cd4s='cd /Users/amilner42/Desktop/programming/git/idea-400cals/400cals'
alias cd4c='cd /Users/amilner42/Desktop/programming/git/idea-400cals/400cals-client'
alias cd4l='cd /Users/amilner42/Desktop/programming/git/idea-400cals/400cals-landing'

###
# Git
###
alias gitlogin="git config credential.helper store"
alias gitpassmemory="git config --global credential.helper cache --timeout=3600"
alias gitcleanall='gita.a ; git reset --hard HEAD'
alias gitcleanstage='git reset HEAD *'
alias gitinit='git init'
alias gitunstage='git reset HEAD'
alias gitundocom='git reset --soft HEAD^'
alias gitdelcom='git reset --hard HEAD^'
alias gitcleanlocalbranches='git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d'


# Git Clone
alias gitcl.='git clone'

# Git Log
alias gitl.='git log --pretty=oneline --decorate --graph'
alias gitl.all='git log --pretty=oneline --decorate --graph --all'


# Git remove
alias gitrm.='git rm'
alias gitrm.c='git rm --cached'

# Git remote
alias gitr.='git remote -v'
alias gitr.a='git remote add'
alias gitr.r='git remote rm'
alias gitr.s='git remote show'
alias gitr.p='git remote prune'

# Git Rebase
alias gitrb.='git rebase'
alias gitrb.i='git rebase -i'
alias gitrb.a='git rebase --abort'
alias gitrb.c='git rebase --continue'

# Git status
alias gits.='git status -s'
alias gits.l='git status'

# Git stash
alias gitst.='git stash'
alias gitst.l='git stash list'
alias gitst.s='git stash save'
alias gitst.a='git stash apply'
alias gitst.p='git stash pop'

# Git push
alias gitps.='git push'
alias gitps.f='git push --force'
alias gitps.t='git push --tags'
alias gitps.su='git push --set-upstream'

# Git pull
alias gitpl.='git pull'
alias gitpl.a='git pull --all'

# Git fetch
alias gitf.='git fetch'

# Git diff
alias gitd.='git diff --ignore-space-change'
alias gitd.no='git diff --ignore-space-change --name-only'
alias gitd.s='git diff --staged --ignore-space-change'

# Git merge
alias gitm.='git merge'
alias gitm.so='git merge --strategy=ours'

# Git commit
alias gitc.='git commit -m'
alias gitc.a='git commit --amend'
alias gitc.am='git commit --amend -m'
alias gitc.ane='git commit --amend --no-edit'

# Git checkout
alias gitch.='git checkout'
alias gitch.b='git checkout -b'

# Git add
alias gita.='git add'
alias gita.a='git add -A'

# Git branch
alias gitb.='git branch'
alias gitb.r='git branch  -r'
alias gitb.l='git branch'
alias gitb.d='git branch -d'
alias gitb.D='git branch -D'

# Git tag
alias gitt.='git tag'
alias gitt.a='git tag -a'

### TMUX

alias tmux.he='tmux select-layout even-horizontal'
alias tmux.ve='tmux select-layout even-vertical'

alias tmux.oskol='tmux_oskol'

# Function to create oskol tmux session with all worktrees
tmux_oskol() {
  local session_name="oskol"

  # Kill existing session if it exists
  tmux kill-session -t $session_name 2>/dev/null

  # Create new session with first window for main oskol directory
  tmux new-session -d -s $session_name -n "oskol" -c /Users/amilner42/Desktop/programming/git/oskol

  # Create windows for each worktree (using -d to avoid switching to them)
  tmux new-window -d -t $session_name: -n "tree1" -c /Users/amilner42/Desktop/programming/git/worktrees/oskol/tree1
  tmux new-window -d -t $session_name: -n "tree2" -c /Users/amilner42/Desktop/programming/git/worktrees/oskol/tree2
  tmux new-window -d -t $session_name: -n "tree3" -c /Users/amilner42/Desktop/programming/git/worktrees/oskol/tree3
  tmux new-window -d -t $session_name: -n "tree4" -c /Users/amilner42/Desktop/programming/git/worktrees/oskol/tree4
  tmux new-window -d -t $session_name: -n "tree5" -c /Users/amilner42/Desktop/programming/git/worktrees/oskol/tree5

  # Create window for claudette
  tmux new-window -d -t $session_name: -n "claudette" -c /Users/amilner42/Desktop/programming/git/claudette

  # Select first window
  tmux select-window -t $session_name:0

  # Attach to session
  tmux attach-session -t $session_name
}

### NPM

alias nr='pnpm run'
alias nr.lint='pnpm run lint:fix'
alias nr.prettier='pnpm run prettier:fix'

### ShadCN

alias shad='pnpm dlx shadcn@latest'
alias shad.add='pnpm dlx shadcn@latest add'

### Elixir

alias mix.f='mix format'
alias mix.s.4000='PORT=4000 mix phx.server'
alias mix.s.4001='PORT=4001 mix phx.server'
alias mix.s.4002='PORT=4002 mix phx.server'
alias mix.s.4003='PORT=4003 mix phx.server'
alias mix.s.4004='PORT=4004 mix phx.server'

### ASDF
 . /usr/local/opt/asdf/libexec/asdf.sh

### NVM

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/usr/local/opt/postgresql@17/bin:$PATH"

### Starship
eval "$(starship init zsh)"

### Local overrides (secrets, machine-specific config — gitignored)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

### Misc

alias hsearch='history | grep'
export PATH="$HOME/.local/bin:$PATH"
