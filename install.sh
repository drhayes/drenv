_osType() {
  local _type="$1"
  echo "$OSTYPE" | grep "$_type" > /dev/null
}

_commandExists() {
  local _cmd="$1"
  which "$_cmd" > /dev/null
}

main() {
  if _osType linux \
  && _commandExists apt-get; then

    # Do we have the basics?
    for _command in curl fish git; do
      if ! _commandExists _command; then
        APPS_TO_INSTALL="$APPS_TO_INSTALL $_command"
      fi
    done

    # Install any we're missing.
    if [ -n "$APPS_TO_INSTALL" ]; then
      [ "$EUID" -ne 0 ] && SUDO="sudo "
      eval "$SUDO apt-get update -y"
      eval "$SUDO apt-get install -y $APPS_TO_INSTALL"
    fi

  fi

  echo Installing drhayes setup via fish
  fish -c 'curl --silent "https://raw.githubusercontent.com/drhayes/drfish/main/functions/drenv-setup.fish" | source && drenv-setup'
}

main
