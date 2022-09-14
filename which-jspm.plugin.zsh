WHICH_JPSM_PROMPT=''

function found_package() {
  if test -f "yarn.lock"; then
    WHICH_JPSM_PROMPT+="%K{#2d8ebb}%F{#ffffff} yarn %F{reset}%K{reset} "
  fi

  if test -f "package-lock.json"; then
    WHICH_JPSM_PROMPT+="%K{#cd3534}%F{#ffffff} npm %F{reset}%K{reset} "
  fi

  if test -f "pnpm-lock.yaml"; then
    WHICH_JPSM_PROMPT+="%K{#f9ad01}%F{#ffffff} pnpm %F{reset}%K{reset} "
  fi
}


add-zsh-hook chpwd chpwd_which_jspm
chpwd_which_jspm() {
  if test -f "package.json";
  then
    found_package
    PROMPT+=$WHICH_JPSM_PROMPT
  elif [ "$WHICH_JPSM_PROMPT" != '' ]
  then
    PROMPT=${PROMPT%$WHICH_JPSM_PROMPT}
    WHICH_JPSM_PROMPT=''
  fi
}

