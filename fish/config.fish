if status is-interactive
  alias cp="cp -iv"
  alias mv="mv -iv"
  alias rm="rm -iv"
  alias nv='nvim'
  alias less="less -R"
  alias tetris='zsh -c "autoload tetriscurses && tetriscurses"'
  alias rmcache='rm -rf ~/Library/Caches/*'
  alias jpdf="/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py"
  alias purge="sudo --stdin purge"
  alias keys="pbcopy < ~/.ssh/id_rsa.pub"
  alias bu="brew update && brew upgrade --greedy"
  alias rs="brew services restart yabai && brew services restart skhd"
  alias ds='fd --hidden --no-ignore ".DS_Store" -x rm'
  alias del-history='/bin/rm "$XDG_DATA_HOME/HISTORY/zsh-history"'
  if type -q exa
    alias ls="exa --icons"
    alias la='exa --icons -a'
    alias ll="exa --icons -alh"
  else
    alias ls="ls -GF"
    alias la="ls -A"
    alias ll="ls -alh"
  end
  fish_vi_key_bindings
  function fish_prompt
    set_color --bold red
    echo -n '['
    set_color yellow 
    echo -n 'sp'
    set_color cyan
    echo -n '@'
    set_color magenta
    echo -n 'home'
    set_color green
    echo -n ':'
    set_color magenta
    echo -n (prompt_pwd)
    set_color red
    echo -n ']'
    set_color green
    echo -n '% '
  end

  function fish_mode_prompt
  end

  set -U fish_color_autosuggestion 504945
  set -U fish_color_cancel -r
  set -U fish_color_command green #white
  set -U fish_color_comment 504945
  set -U fish_color_cwd green
  set -U fish_color_cwd_root red
  set -U fish_color_end brblack #blue
  set -U fish_color_error red
  set -U fish_color_escape yellow #green
  set -U fish_color_history_current --bold
  set -U fish_color_host normal
  set -U fish_color_match --background=brblue
  set -U fish_color_normal normal
  set -U fish_color_operator blue #green
  set -U fish_color_param bdae93
  set -U fish_color_quote yellow #brblack
  set -U fish_color_redirection cyan
  set -U fish_color_search_match bryellow --background=504945
  set -U fish_color_selection white --bold --background=504945
  set -U fish_color_status red
  set -U fish_color_user brgreen
  set -U fish_color_valid_path --underline
  set -U fish_pager_color_completion normal
  set -U fish_pager_color_description yellow --dim
  set -U fish_pager_color_prefix white --bold #--underline
  set -U fish_pager_color_progress brwhite --background=cyan
  set fish_cursor_default block
  set fish_cursor_insert line
  set fish_cursor_replace_one underscore
  set fish_cursor_visual block
end

set -g fish_greeting
set -gx MANPAGER 'nvim +Man!'
set -U fish_user_paths /usr/local/bin $fish_user_paths
