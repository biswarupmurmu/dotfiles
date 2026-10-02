# Dotfiles

This repository contains my personal system configurations, managed via a Git bare repository.

## Setup on a New Machine

### 1. Clone the Repository

```bash
git clone --bare https://github.com/biswarupmurmu/dotfiles.git

```

### 2. Define the Temporary Alias

```bash
alias dotgit='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'

```

### 3. Checkout the Configuration

```bash
dotgit checkout main

```

**Resolving Errors:**
`error: The following untracked working tree files would be overwritten by checkout:` This happens because default configuration files (like .bashrc) already exist in home directory, and Git refuses to overwrite them.

```bash
mkdir -p $HOME/.dotfiles-backup
# Move the specific files Git complained about into the backup folder
mv ~/.bashrc ~/.dotfiles-backup/
# Repeat this 'mv' command for any other conflicting files Git listed
```

```bash
# Re-run the checkout
dotgit checkout main

```
Manually copy or merge some local configurations from the backup into newly checked-out dotfiles else the files are safe to delete.
```bash
# Delete the backup
rm -rf ~/.dotfiles-backup/
```

### 4. Hide Untracked Files

```bash
dotgit config --local status.showUntrackedFiles no

```

## Managing dotfiles

The alias `dotgit` is saved in `.bashrc`. Use the `dotgit` command instead of `git`.

**Check status:**

```bash
dotgit status

```

**Add a new configuration file:**

```bash
dotgit add .config/sway/config
dotgit add .config/nvim/init.lua

```

**Commit and push changes:**

```bash
dotgit commit -m "commit message"
dotgit push origin main

```
