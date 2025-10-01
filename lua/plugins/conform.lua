return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
      },
    })
  end,
}
