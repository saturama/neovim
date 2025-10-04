--- * ---
require("simple")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
require("config.gx_like_a_boss")

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



