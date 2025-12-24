return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "bashls",
        "pyright",
        "clangd",
        "gopls",
        "jdtls",
      },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Capabilities para autocomplete
      local capabilities =
          require("cmp_nvim_lsp").default_capabilities()

      -- Lista dos servidores
      local servers = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "bashls",
        "pyright",
        "clangd",
        "gopls",
        "jdtls",
      }

      -- Configurações específicas
      local server_settings = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          },
        },
      }

      -- Autostart via autocmd
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "*" },
        callback = function(event)
          local ftype = vim.bo[event.buf].filetype

          for _, name in ipairs(servers) do
            local cfg = vim.lsp.config[name]

            if cfg and cfg.filetypes and vim.tbl_contains(cfg.filetypes, ftype) then
              local merged = vim.tbl_deep_extend(
                "force",
                cfg,
                server_settings[name] or {},
                { capabilities = capabilities }
              )

              vim.lsp.start(merged)
            end
          end
        end,
      })
    end,
  },
}
