if status is-interactive
    zoxide init fish | source
    fzf --fish | source
    alias cd="z"
    alias cat="bat"
    alias nvim="$HOME/.apps/nvim.appimage"
    alias q="exit"
    alias ls="eza"
    sh nvm
    set MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set fish_user_paths /usr/local/bin $fish_user_paths
    set fish_user_paths $HOME/.apps $fish_user_paths
    set GPG_TTY $(tty)


    function !!
        set var (history | head -n 1)
        if test $argv
            if test $argv = sudo #; or "any other command you want to prepend"
                eval $argv $var
            else
                eval $var $argv
            end
        else
            eval $var
        end
    end

    # Commands to run in interactive sessions can go here
end
