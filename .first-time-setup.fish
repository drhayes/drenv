#! /usr/bin/env fish

function __drenv_message -a name --description "Show a message that things are present."
  echo (set_color green)$name(set_color normal) is present.
end

# Grab the config.
if not test -f ~/.config/fish/config.fish
  curl https://raw.githubusercontent.com/drhayes/drfish/main/config.fish -o ~/.config/fish/config.fish
else
  __drenv_present config.fish
end

# Is tide there?
if not type tide > /dev/null
  curl -sL git.io/tide | source && tide_install -l
else
  __drenv_present tide
end

# Install fisher.
if not type fisher > /dev/null
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
else
  __drenv_present fisher
end

# Grab the fishfile.
if not test -f ~/.config/fish/fishfile
  curl https://raw.githubusercontent.com/drhayes/drenv/main/fishfile -o ~/.config/fish/fishfile
else
  __drenv_present fishfile
end

# Run fisher to grab our plugins.
fisher
