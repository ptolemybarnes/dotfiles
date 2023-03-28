source ~/.config/fish/aliases.fish

alias vim=nvim
set -x SNIPPETS_PATH /Users/ptolemy/deck/code-snippets
set -x SHELL /opt/homebrew/bin/fish
# use fd for fzf, as fd respects .gitignore
set -x FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix'
set -x VIMRC ~/.config/nvim/init.vim

fish_add_path /opt/homebrew/bin
fish_add_path (brew --prefix)/opt/findutils/libexec/gnubin
fish_add_path (brew --prefix)/opt/gnu-sed/libexec/gnubin
fish_add_path ./node_modules/.bin
fish_add_path /usr/local/bin

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

fish_default_key_bindings

[ -s "/Users/ptolemy/.jabba/jabba.fish" ]; and source "/Users/ptolemy/.jabba/jabba.fish"
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

# sets node version in folders containing an .nvmrc file
function __check_nvm --on-variable PWD --description 'Do nvm stuff'
  if test -f .nvmrc
      nvm use
  end
end

set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths
status --is-interactive; and rbenv init - fish | source
