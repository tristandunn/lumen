return {
  init = function()
    local gitsigns = require("gitsigns")
    local set      = vim.keymap.set

    -- Navigate to the next hunk.
    set("n", "]c", gitsigns.next_hunk)

    -- Navigate to the previous hunk.
    set("n", "[c", gitsigns.prev_hunk)

    -- Stage the current buffer.
    set("n", "<Leader>sb", "<ESC>:Gitsigns stage_buffer<CR>")

    -- Add the file at the current path.
    set("n", "<Leader>sf", "<ESC>:!git add %:p<CR><CR>")

    -- Stage the current hunk.
    set("n", "<Leader>sh", "<ESC>:Gitsigns stage_hunk<CR>")

    -- Display the cached difference.
    set("n", "<Leader>gdc", "<ESC>:ExecuteCommandInPane git\\ diff\\ --cached 1 1<CR>")

    -- Display the difference.
    set("n", "<Leader>gdi", "<ESC>:ExecuteCommandInPane git\\ diff 1 1<CR>")

    -- Pull the latest changes.
    set("n", "<Leader>gp", "<ESC>:ExecuteCommandInPane git\\ pull 0 0 3<CR>")

    -- Display the current status.
    set("n", "<Leader>gs", "<ESC>:ExecuteCommandInPane git\\ status 0 0 3<CR>")
  end,

  opts = {
    numhl = true,
    signs = {
      add          = { text = " +" },
      change       = { text = " ~" },
      delete       = { text = " -" },
      topdelete    = { text = " ‾" },
      changedelete = { text = " ~" },
      untracked    = { text = " ┆" }
    }
  }
}
