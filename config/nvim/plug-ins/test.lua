return {
  init = function()
    local set = vim.keymap.set

    -- Run the last test.
    set("n", "<Leader>l", "<Cmd>TestLast<CR>")

    -- Run the nearest test.
    set("n", "<Leader>n", "<Cmd>TestNearest<CR>")

    -- Run the full test suite.
    set("n", "<Leader>s", "<Cmd>TestSuite<CR>")

    -- Run tests for the current file.
    set("n", "<Leader>f", "<Cmd>TestFile<CR>")

    -- Run tests in a Neovim terminal split at the bottom.
    vim.g["test#strategy"]             = "neovim"
    vim.g["test#neovim#term_position"] = "botright 24"
  end
}
