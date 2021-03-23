# variables
set -x EDITOR nvim
set -x SHELL fish
set -x fish_term256 1
set -x fish_term24bit 1 

# PATH
fish_add_path $HOME/.cargo/bin

switch (uname)
  case Darwin
    fish_add_path /opt/homebrew/bin
end

# aliases
## Neovim
alias vim="nvim"

## git alias
alias g="git"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

## replace ls for exa
alias ls="exa -l"
alias la="exa -la"

## homebrew workaround
# fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Nord color
set -l foreground d8dee9
set -l selection 434c5e
set -l comment 4c566a
set -l red bf616a
set -l orange d08770
set -l yellow ebcb8b
set -l green a3be8c
set -l purple 5e81ac
set -l cyan 88c0d0
set -l pink b48ead

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_match --background=$selection
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# suppress greeting
set fish_greeting

set -g hydro_color_pwd $cyan

# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end
