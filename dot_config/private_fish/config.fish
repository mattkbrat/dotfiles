if status is-interactive
    zoxide init fish | source
    alias cd="z"
    alias cat="bat"
    alias q="exit"
    set fish_user_paths /usr/local/bin $fish_user_paths
    set fish_user_paths $HOME/.apps $fish_user_paths
    # Commands to run in interactive sessions can go here
end
