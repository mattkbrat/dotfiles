if status is-interactive
    zoxide init fish | source
    alias cd="z"
    alias cat="bat"
    alias nvim="$HOME/.apps/nvim.appimage"
    alias q="exit"
    alias ls="eza"
    set MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set fish_user_paths /usr/local/bin $fish_user_paths
    set fish_user_paths $HOME/.apps $fish_user_paths
    # Commands to run in interactive sessions can go here
end
