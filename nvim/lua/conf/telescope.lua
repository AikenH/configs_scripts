-- wait for update, we donot setting the keymap for now
-- https://github.com/nvim-telescope/telescope.nvim
-- telescope 手动安装依赖 fd 和 repgrep

-- https://github.com/sharkdp/fd
-- https://github.com/BurntSushi/ripgrep

require("telescope").setup()
require("telescope").load_extension("project")
require("telescope").load_extension("aerial")
-- require("telescope").load_extension("media_files")
-- require 'telescope'.extensions.project.project{ display_type = 'full' }

vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fh", ":Telescope help_tags<CR>", {noremap = true})

-- recent fils, marks, colorschemes, project
vim.keybinds.gmap("n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fs", "<cmd>Telescope colorscheme theme=dropdown<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fp", "<cmd>Telescope project theme=dropdown<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fd", "<cmd>Telescope aerial theme=dropdown<CR>", vim.keybinds.opts)
-- here introduce some keymap of telescope's projects manage.
-- d: delete c: create r: rename s: search inside whithin your project

-- project add not work in those repo which witout git init
-- manaly add the repo in the config file ~/.local/share/nvim/telescope-projects.txt
-- format like :
-- Nvim LabelExtrator=/Users/aikenhong/workspace/LabelExtrator=w0=1=1
