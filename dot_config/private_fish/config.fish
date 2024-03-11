if status is-interactive
    zoxide init fish | source
    alias cd="z"
    alias cat="bat"
    # Commands to run in interactive sessions can go here
end
