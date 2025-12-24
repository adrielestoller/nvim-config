return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    configs = {
      ensure_installed = {
        "lua", "javascript", "typescript", "html", "css",
        "java", "c", "bash", "json", "yaml", "markdown"
      },
      highlight = { enable = true },
      indent = { enable = true },
    }
  }
}
