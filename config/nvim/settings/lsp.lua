-- Add additional shortcuts for LSP commands.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local buf    = vim.lsp.buf
    local buffer = event.buf
    local set    = vim.keymap.set

    -- Add shortcuts for definition and declaration.
    set("n", "gd", buf.definition, { buffer = buffer, silent = true })
    set("n", "grd", buf.declaration, { buffer = buffer, silent = true })

    -- Format selection.
    set({ "n", "x" }, "gq", function()
      buf.format({ async = true, bufnr = buffer })
    end, { buffer = buffer, silent = true })
  end
})

vim.diagnostic.config({
  -- Update diagnostics in insert mode.
  update_in_insert = true,

  -- Always display diagnostics inline as virtual text.
  virtual_text = {
    source = true
  }
})

