if status is-interactive
    zoxide init fish | source
    fzf --fish | source
    alias cd="z"
    alias cat="bat"
    alias nvim="$HOME/.apps/nvim.appimage"
    alias q="exit"
    alias ls="eza"
    alias c="clear"
    alias e="nnn"
    alias n="nvim"
    alias fd="fdfind"
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv

    nvm
    set MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set fish_user_paths /usr/local/bin $fish_user_paths
    set fish_user_paths $HOME/.apps $fish_user_paths
    set GPG_TTY $(tty)
    set NNN_PLUG 'f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'
    set -x GOPATH /usr/local/go

    set -x PATH $PATH $GOPATH/bin

    set GUIX_PROFILE "$HOME/.guix-profile"
    set GUIX_LOCPATH "$HOME/.guix-profile/lib/locale"

    set -x PATH $PATH $GUIX_LOCPATH

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

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export FLUTTER_INSTALL "$HOME/flutter"
set --export PATH $FLUTTER_INSTALL/bin $PATH

set --export ANDROID_STUDIO_INSTALL /usr/local/android-studio
set --export PATH $ANDROID_STUDIO_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/matt/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
