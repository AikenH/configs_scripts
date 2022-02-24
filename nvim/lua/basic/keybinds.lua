-- add ALL your KEYMAPs here(including the plugins)
-- Make SPC the leader key
vim.g.mapleader = " "

-- remap the default keymap of nvim
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = {noremap = true, silent = true}
}

-- using tab and shift-tab to change the indent
vim.keybinds.gmap("n", "<tab>", "V>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<S-tab>", "V<", vim.keybinds.opts)
vim.keybinds.gmap("v", "<tab>", ">gv", vim.keybinds.opts)
vim.keybinds.gmap("v", "<S-tab>", "<gv", vim.keybinds.opts)

-- using alt + arrow to change the window
vim.keybinds.gmap("n", "<A-Up>", ':wincmd k<CR>', vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-Down>", ':wincmd j<CR>', vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-Left>", ':wincmd h<CR>', vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-Right>", ':wincmd l<CR>', vim.keybinds.opts)

