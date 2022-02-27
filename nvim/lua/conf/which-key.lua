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

-- NOTE: my personal keymapping settings
local wk = require("which-key")

-- <prefix = f> which is most about telescope and find files
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
        a = { "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", "Find Actions" },
        s = { "<cmd>Telescope colorscheme theme=dropdown<CR>", "Find Themes" },
        p = { "<cmd>Telescope project<CR>", "Find Project" }
    },
}, { prefix = "<leader>" })

-- <prefix = t>  Tab and Terminal
wk.register({
    t = {
        name = "Term&Tags",
        t = { "<cmd>exe v:count.'ToggleTerm'<CR>", "O/E Terminal" },
        f = { "<cmd>lua require('toggleterm').float_toggle()<CR>", "Float-Trem" },
        g = { "<cmd>lua require('toggleterm').lazygit_toggle()<CR>", "Lazygit"},
        a = { "<cmd>ToggleTermToggleAll<CR>", "Toggleterm" },
        q = { "<cmd>Bdelete!<CR>", "Quit-Buff" },
        -- ["1"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer-1" },
        -- ["2"] = { "<cmd>BufferLineGoToBuffer 2<CR>", "Buffer-2" },
        -- ["3"] = { "<cmd>BufferLineGoToBuffer 3<CR>", "Buffer-3" },
        -- ["4"] = { "<cmd>BufferLineGoToBuffer 4<CR>", "Buffer-4" },
        -- ["5"] = { "<cmd>BufferLineGoToBuffer 5<CR>", "Buffer-5" },
        -- ["6"] = { "<cmd>BufferLineGoToBuffer 6<CR>", "Buffer-6" },
        -- ["7"] = { "<cmd>BufferLineGoToBuffer 7<CR>", "Buffer-7" },
    },
}, { prefix = "<leader>" })

wk.register({

    ["<leader>1"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer-1" },
    ["<leader>2"] = { "<cmd>BufferLineGoToBuffer 2<CR>", "Buffer-2" },
    ["<leader>3"] = { "<cmd>BufferLineGoToBuffer 3<CR>", "Buffer-3" },
    ["<leader>4"] = { "<cmd>BufferLineGoToBuffer 4<CR>", "Buffer-4" },
    ["<leader>5"] = { "<cmd>BufferLineGoToBuffer 5<CR>", "Buffer-5" },
    ["<leader>6"] = { "<cmd>BufferLineGoToBuffer 6<CR>", "Buffer-6" },
    ["<leader>7"] = { "<cmd>BufferLineGoToBuffer 7<CR>", "Buffer-7" },
    

})

wk.register({
    l = {
        name = "Langs",
        p = { "<cmd>MarkdownPreview<CR>", "Preview" },
    }
}, { prefix = "<leader>"} )
-- toggle the layout of tree and Outline
-- we use the F2, F3, F4 to replace this.
-- wk.register({
--     ["<leader>1"] = { "<cmd>NvimTreeToggle<CR>", "File-Tree" },
-- })
--
-- wk.register({
--     ["<leader>2"] = { "<cmd>Vista!!<CR>", "Outline" },
-- })
-- 
-- wk.register({
--     ["<leader>3"] = { "<cmd>UndotreeToggle<CR>", "undo-history" },
-- })
-- <Prefix = C> TBD

