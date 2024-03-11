if status is-interactive
    zoxide init fish | source
    alias cd="z"
    alias cat="bat"
    alias nvim="$HOME/.apps/nvim.appimage"
    alias q="exit"
    # Commands to run in interactive sessions can go here
end
