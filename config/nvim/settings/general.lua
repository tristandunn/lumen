local global = vim.g
local option = vim.opt


global.is_posix = true -- Assume POSIX shell in vim.

-- Disable unused language providers for faster startup.
global.loaded_node_provider    = 0
global.loaded_perl_provider    = 0
global.loaded_python3_provider = 0
global.loaded_ruby_provider    = 0


option.exrc        = true  -- Enable local .nvim.lua files.
option.mouse       = "a"   -- Enable mouse support in all modes.
option.swapfile    = false -- No swap files.
option.writebackup = false -- Don't write backup files.


-- Case only matters with mixed case expressions.
option.ignorecase = true
option.smartcase  = true


-- Hide often unnecessary directories and files.
global.netrw_list_hide = table.concat({
  "^\\.\\/$",
  "^\\.bundle\\/",
  "^\\.dockerignore$",
  "^\\.eslintignore$",
  "^\\.eslintrc$",
  "^\\.git\\/",
  "^\\.gitattributes$",
  "^\\.gitignore$",
  "^\\.rspec$",
  "^\\.ruby-lsp\\/",
  "^\\.yarn\\/",
  "^\\.yarnrc$",
  "^node_modules\\/",
  "^tmp\\/$",
  "^yarn.lock$"
}, ",")
