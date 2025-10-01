require("simple")
require("config.lazy")

vim.lsp.enable({
  "pylsp",
  "lua_ls",
})

vim.diagnostic.config({
  virtual_lines = true,
  underline = false,
  update_in_insert = false,
  severity_sort = true,
})
