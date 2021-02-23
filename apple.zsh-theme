function zsh_User() {
  echo -n "%{$fg[green]%}%n"
}

function zsh_Directory() {
  echo -n "%{$fg[yellow]%}%d"
}

function zsh_VcsInfo() {
  setopt promptsubst
  autoload -Uz vcs_info

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats "%b"

  vcs_info

  if [ -n "$vcs_info_msg_0_" ]; then
    echo -n "%{$fg[cyan]%}($vcs_info_msg_0_)"
  fi
}

function zsh_Icon() {
  echo # New line
  echo -n "%{$reset_color%}"
}

# https://geoff.greer.fm/lscolors/
export LSCOLORS=exfxcxdxbxegedabagacad

PROMPT='$(zsh_User) $(zsh_Directory) $(zsh_VcsInfo) $(zsh_Icon) '
