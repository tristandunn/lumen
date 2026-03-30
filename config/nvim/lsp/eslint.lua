return {
  cmd          = { "vscode-eslint-language-server", "--stdio" },
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  filetypes    = { "javascript" },
  root_markers = { "eslint.config.js" },
  settings     = {
    codeActionsOnSave   = { enable = false, mode = "all" }, -- Don't enable code actions on save.
    format              = true,                             -- Enable formatting.
    nodePath            = "",                               -- Must be a string.
    problems            = { shortenToSingleLine = false },  -- Don't shorten problems.
    rulesCustomizations = {},                               -- No rules customizations.
    validate            = "on"                              -- Enable validation.
  }
}
