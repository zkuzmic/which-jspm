# Define prompts for each package manager
NPM_PROMPT="%K{#cd3534}%F{#ffffff} npm %F{reset}%K{reset} "
YARN_PROMPT="%K{#2d8ebb}%F{#ffffff} yarn %F{reset}%K{reset} "
PNPM_PROMPT="%K{#f69220}%F{#ffffff} pnpm %F{reset}%K{reset} "
BUN_PROMPT="%K{#5e5e5e}%F{#ffffff} bun %F{reset}%K{reset} "

# Hook to update prompt on directory change
add-zsh-hook chpwd which-jspm
which-jspm() {
  local NEW_PROMPT=$PROMPT
  NEW_PROMPT="${NEW_PROMPT//$NPM_PROMPT}"
  NEW_PROMPT="${NEW_PROMPT//$YARN_PROMPT}"
  NEW_PROMPT="${NEW_PROMPT//$PNPM_PROMPT}"

  # Recursively search parent directories for package.json
  local DIR=$PWD
  while
    PKG_PATH=$(find "$DIR"/ -maxdepth 1 -name "package.json")
    [[ -z $PKG_PATH ]] && [[ "$DIR" != "/" ]]
  do DIR=$(dirname "$DIR"); done

  if test "$PKG_PATH";
  then
    # Check for npm
    if test -f "$DIR/package-lock.json"; then
      NEW_PROMPT+=$NPM_PROMPT
    fi

    # Check for yarn
    if test -f "$DIR/yarn.lock"; then
      NEW_PROMPT+=$YARN_PROMPT
    fi

    # Check for pnpm
    if test -f "$DIR/pnpm-lock.yaml"; then
      NEW_PROMPT+=$PNPM_PROMPT
    fi

    # Check for bun
    if test -f "$DIR/bun.lockb"; then
      NEW_PROMPT+=$BUN_PROMPT
    fi
  fi

  # Only update PROMPT if NEW_PROMPT is different
  if [ "$PROMPT" != "$NEW_PROMPT" ]; then
        PROMPT=$NEW_PROMPT
  fi
}
