-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
require'nvim-treesitter.configs'.setup{
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = {"python", "cpp", "vim", "lua", "yaml", "json", "latex", "markdown", "comment"},
    sync_install = false,
    -- 启用代码高亮功能
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    context_commentstring = { enable = true, enable_autocmd = false },
    matchup = { enable = true },
    context = { enable = true, throttle = true },
    -- if we want to enable this function we should change the tab
    -- which has conflict with the indent keymap with our setting
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            --scope_incremental = '<TAB>',
        },
        -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
    },
    indent = {
        enable = false
    },
     -- 彩虹括号，由 nvim-ts-rainbow 插件提供
    rainbow = {
        enable = true,
        extended_mode = true
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
}
-- 开启 Folding
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
