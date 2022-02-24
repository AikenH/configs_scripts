-- https://github.com/folke/which-key.nvim

require("which-key").setup(
    {
        plugins = {
            spelling = {
                -- 是否接管默认 z= 的行为
                enabled = true,
                suggestions = 20
            }
        }
    }
)

-- TODO: add the keymap for ourself
local wk = require("which-key")
wk.register({
    f = {
        name = "Files",
        f = { "<cmd>Telescope find_files<CR>", "Find Files" },
        g = { "<cmd>Telescope live_grep<CR>", "Find Words" },
        b = { "<cmd>Telescope buffers<CR>", "Find buffers" },
        h = { "<cmd>Telescope help_tags<CR>", "Find help" },
        o = { "<cmd>Telescope oldfiles theme=dropdown<CR>", "Find History" },
        m = { "<cmd>Telescope marks theme=dropdown<CR>", "Find Marks" },
        t = { "<cmd>TodoTelescope  theme=dropdown<CR>", "Todo List" },
        n = { "<cmd>lua require('telescope').extensions.notify.notify()<CR>","Find notify" },
        c = { "<cmd>NvimTreeFindFile<CR>", "Cur-FileTree" },
        a = { "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", "Find Actions"}
    },
}, { prefix = "<leader>" })
