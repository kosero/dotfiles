set -U fish_greeting ""
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/go/bin $PATH
set -gx GPG_TTY (tty)

#theme_gruvbox dark

pfetch

# opencode
fish_add_path /home/kosero/.opencode/bin
