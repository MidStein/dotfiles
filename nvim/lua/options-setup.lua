vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.exrc = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.secure = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.visualbell = true
vim.opt.wildignorecase = true

vim.opt.scrolloff = 5
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.background = 'light'
vim.opt.colorcolumn = '80'
vim.opt.signcolumn = 'yes'

vim.opt.foldopen:remove 'block'
vim.opt.nrformats:remove 'octal'

vim.opt.clipboard:append 'unnamedplus'
vim.opt.nrformats:append 'unsigned'
vim.opt.path:append '**'

local patterns = { '.git', 'target', 'node_modules', 'dist', '.venv', '__pycache__', '*.pdf' }
for _, pattern in ipairs(patterns) do
  vim.opt.wildignore:append(pattern)
end
