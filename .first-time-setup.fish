#! /usr/bin/env fish

if not test -f ~/.config/fish/config.fish
  curl https://raw.githubusercontent.com/drhayes/drfish/main/config.fish -o ~/.config/fish/config.fish
else
  echo (set_color yellow)config.fish(set_color normal) is present.
end

if not type fisher > /dev/null
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
else
  echo (set_color yellow)fisher(set_color normal) is present.
end

if not test -f ~/.config/fish/fishfile
  curl https://raw.githubusercontent.com/drhayes/drenv/main/fishfile -o ~/.config/fish/fishfile
else
  echo (set_color yellow)fishfile(set_color normal) is present.
end
