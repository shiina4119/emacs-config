# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export QT_QPA_PLATFORM=wayland

# base64 decode function
b64d() { echo -n $1 | base64 -d && echo; }

# warp
alias warpon="wg-quick up warp"
alias warpoff="wg-quick down warp"
alias warpstatus="~/Software/wgcf trace | grep warp"

# spicetify
export PATH=$PATH:/home/shiina/.spicetify
alias spiceup="spicetify update && spicetify restore backup apply"

# bitwarden
alias pass="~/Software/bitwarden"

alias codium="codium --unity-launch --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"

# flatpak aliases
# alias vlc="flatpak run org.videolan.VLC"
alias lofi="mpv --no-video https://www.youtube.com/watch?v=4xDzrJKXOOY"
alias ghostwriter="flatpak run io.github.wereturtle.ghostwriter"

# firefox profiles
alias whatsapp="firefox -p whatsapp &"
alias snuff="firefox -p git &"
alias cprog="firefox -p cprog &"

. "$HOME/.cargo/env"

# leetcode-cli (cargo) completions
eval "$(leetcode completions)"

alias commit_libssh="git commit --trailer=\"Signed-off-by: Debanga Sarma <deb737@proton.me>\""

