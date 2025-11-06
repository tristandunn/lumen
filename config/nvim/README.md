# neovim

My neovim configuration.

## LSP Servers

```sh
# Install servers for Docker, Lua, Ruby, TailwindCSS, and JavaScript.
yay -S --needed --noconfirm \
    dockerfile-language-server \
    lua-language-server \
    tailwindcss-language-server \
    vscode-langservers-extracted \
    yaml-language-server-bin

# Install servers for RuboCop and extensions for Ruby.
gem install rubocop \
            ruby-lsp \
            ruby-lsp-rails \
            ruby-lsp-rspec

# Install server for ERB and Stylelint.
npm install --global @herb-tools/language-server \
                     @herb-tools/linter \
                     stylelint-lsp
```
