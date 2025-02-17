vim.opt.cmdheight = 0
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.termguicolors = true
vim.opt.spell = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', trail = '·', nbsp = '␣' }
vim.opt.fillchars:append({ eob = ' '})
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true
vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir:remove('.')
vim.opt.shortmess:append({ I = true })
vim.opt.wildmode = 'longest:full,full'
vim.opt.completeopt = 'menuone,longest,preview'
vim.opt.signcolumn = 'yes:2'
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.opt.redrawtime = 10000
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.titlestring = '%f // nvim'
vim.opt.inccommand = 'split'
