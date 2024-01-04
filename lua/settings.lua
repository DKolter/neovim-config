vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("USERPROFILE") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.wo.number = true
vim.opt.signcolumn = "yes"
