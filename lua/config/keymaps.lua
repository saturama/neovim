-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- ADD ANY ADDITIONAL KEYMAPS HERE

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- clear search highlights with <Esc>
map("n", "<esc>", ":nohlsearch<CR>", opts)


-- wrap toggle (по умолчанию выключено)
map("n", "<leader>w", function()
  vim.opt.wrap = not vim.opt.wrap:get()
end, opts)

map("n", "<leader>nn", function()
  vim.opt.number = not vim.opt.number:get()
end, opts)

map("n", "<leader>nr", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, opts)
