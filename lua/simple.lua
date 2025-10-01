vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.winborder = "rounded" -- options: "single","double","rounded","solid","shadow","none"

vim.cmd [[ colorscheme koehler ]]

vim.opt.termguicolors = true
vim.opt.scrolloff = 3
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindentopt = 'shift:2'
vim.opt.showbreak = '↪ '
vim.opt.fillchars:append({ eob = ' ' })
vim.opt.list = true
vim.opt.listchars = {
  tab = '▸ ',
  trail = '·',
  extends = '>',
  precedes = '<',
  nbsp = '␣',
}
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrapscan = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.ui.open = function(url)
  vim.fn.jobstart({ "xdg-open", url }, { detach = true })
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
