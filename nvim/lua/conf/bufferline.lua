-- https://github.com/akinsho/bufferline.nvim

require("bufferline").setup(
    {
        options = {
            -- 为每个 buffer 都配置一个序数
            numbers = "ordinal",
            -- 使用内置 LSP 进行诊断
            diagnostics = "nvim_lsp",
            -- 不建议更改图标
            indicator_icon = "▎",
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            -- 分割符样式："slant" | "thick" | "thin"
            -- 如果是透明背景，不推荐使用 slant
            separator_style = "slant",
            -- 左侧让出 nvim-tree 的位置
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left"
                }
            },
            -- 显示 LSP 报错图标
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " " or (e == "warning" and " " or "")
                    s = s .. n .. sym
                end
                return s
            end
        }
    }
)

-- 关闭当前 buffer，由 bufdelete 插件所提供的方法
-- vim.keybinds.gmap("n", "<C-q>", "<cmd>Bdelete!<CR>", vim.keybinds.opts)
-- -- 切换上一个缓冲区
-- vim.keybinds.gmap("n", "<C-Left>", "<cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)

-- 切换下一个缓冲区
vim.keybinds.gmap("n", "<leader>tq", "<cmd>Bdelete!<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", vim.keybinds.opts)
