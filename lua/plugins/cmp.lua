return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
  },
  opts = function()
    local cmp = require("cmp")

    vim.api.nvim_set_hl(0, "CmpItemSel", {
      bg = "#3c3836",
      fg = "#ebdbb2",
      blend = 25,
    })

    cmp.setup({
      preselect = cmp.PreselectMode.Item,
      completion = {
        completeopt = "menu,menuone,noinsert",
      },

      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),

        ["j"] = cmp.mapping.select_next_item(),
        ["k"] = cmp.mapping.select_prev_item(),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    })
  end,
}
