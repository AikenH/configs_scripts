-- TODO:read the lua syntax detail, and findout how to move our vimscipt to it
-- like how to run a code and debug etc.

vim.g.background_transparency = true
vim.g.undotree_dir = "~/.cache/nvim/undodir"
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet"
-- NOTE: setting the dap python here
vim.g.python_path = "/home/aiken/anaconda3/bin/python"

-- FIX: we can only change the theme in the github configs
-- maybe with the order of install the plugins
-- but we need to find out how to solve this
-- vim.cmd([[colorscheme sonokai]])
