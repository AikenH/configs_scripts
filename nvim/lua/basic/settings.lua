-- Set up BASIC RULES for vim
-- i may copy sth from my old config file of nvim
vim.o.encoding = "UTF-8"
-- support chinese?
-- vim.o.termencoding = "UTF-8"
-- vim.o.fileencoding = "UTF-8, ucs-bom, gb18080, gbk, gb2312, cp936"

vim.o.updatetime = 100
vim.o.showcmd = true
vim.o.timeoutlen = 500
vim.o.hidden = true

vim.o.cursorline = false
vim.o.syntax = "enable"
vim.o.wildmenu = false
vim.o.showmatch = true

vim.o.confirm = true
vim.o.compatible = false
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = false

vim.o.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:↴")

vim.o.autoindent = true
-- vim.o.tabstop = 4
-- vim.o.expandtab = true
-- vim.o.smarttab = true
-- vim.o.shiftwidth = 4
-- vim.cindent = true

-- which is using the extra file to design the indent in ftpfiles
vim.o.filetype = "plugin"

vim.o.showtabline = 2

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.mouse = "a"
vim.o.selection = "exclusive"
vim.o.selectmode = "mouse,key"

vim.o.clipboard = "unnamedplus"

vim.o.backup = false
vim.o.swapfile = false

--vim.o.spell = true
--vim.o.spelllang = "en_us,cjk"

-- we using the treesitter as out folder
vim.o.foldenable = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
-- make the foldlevel as the top
-- vim.cmd("autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))")
-- vim.o.foldnestmax = 3

vim.o.laststatus = 2
vim.o.ruler = true
vim.o.background = "dark"
--vim.cmd([[colorscheme edge]])

vim.cmd("highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40")
vim.cmd("highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000")
vim.o.termguicolors = true
