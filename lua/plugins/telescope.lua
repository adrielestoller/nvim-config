return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" }
      }
    })

    local map = vim.keymap.set
    map("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
    map("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>")
    map("n", "<Leader>fb", "<cmd>Telescope buffers<CR>")
    map("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>")
  end,
}
