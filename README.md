# which-jspm

A zsh plugin to tell you which package manager the current package is using

This plugin adds `npm`, `yarn`, `pnpm`, or `bun` at the end of your zsh prompt based on which lockfile(s) are present in the current directory or parent.

## `oh-my-zsh` Installation

### Required

1. Clone this repo into `~/.oh-my-zsh/custom/plugins`
2. Add `which-jspm` to your list of plugins in `.zshrc` (e.g. `plugins=(git which-jspm)`)

### Optional
- If you want `which-jspm` to run immediately when you launch a new shell (instead of only when changing directories), include `which-jspm` on a new line near the bottom of `.zshrc`.
