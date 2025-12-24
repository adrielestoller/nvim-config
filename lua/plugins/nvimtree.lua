return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    sort_by = "case_sensitive",
    view = {
      width = 30,
      side = "left",
    },
    renderer = {
      group_empty = true,
    },
    git = {
      ignore = false,
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
  end,
}
