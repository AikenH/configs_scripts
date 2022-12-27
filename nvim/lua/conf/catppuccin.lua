-- https://github.com/catppuccin/nvim
vim.g.catppuccin_flavour = "macchiato"
require("catppuccin").setup({
    dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	transparent_background = vim.g.background_transparency,
	term_colors = false,
	compile = {
		enabled = false,
		path = vim.fn.stdpath "cache" .. "/catppuccin",
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		coc_nvim = false,
		lsp_trouble = false,
		cmp = true,
		lsp_saga = false,
		gitgutter = false,
		gitsigns = true,
		leap = false,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = vim.g.background_transparency,
		},
		neotree = {
			enabled = false,
			show_root = true,
			transparent_panel = false,
		},
		dap = {
			enabled = false,
			enable_ui = false,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		bufferline = true,
		markdown = true,
		lightspeed = false,
		ts_rainbow = false,
		hop = false,
		notify = true,
		telekasten = true,
		symbols_outline = true,
		mini = false,
		aerial = false,
		vimwiki = true,
		beacon = true,
		navic = false,
		overseer = false,
	},
	color_overrides = {},
	highlight_overrides = {},
})
-- require("catppuccin").setup(
--     {
--         -- 透明背景
--         transparent_background = vim.g.background_transparency,
--         -- 使用终端背景色
--         term_color = false,
--         -- 代码样式
--         styles = {
--             comments = "italic",
--             functions = "NONE",
--             keywords = "NONE",
--             strings = "NONE",
--             variables = "NONE"
--         },
--         -- 为不同的插件统一样式风格
--         -- 尽管这里有一些插件还没有安装，但是先将它们
--         -- 设置为 true 并不影响
--         integrations = {
--             cmp = true,
--             gitsigns = true,
--             telescope = true,
--             which_key = true,
--             bufferline = true,
--             markdown = true,
--             ts_rainbow = true,
--             hop = true,
--             notify = true,
--             indent_blankline = {
--                 enabled = true,
--                 colored_indent_levels = false
--             },
--             nvimtree = {
--                 enabled = true,
--                 show_root = false,
--                 -- 透明背景
--                 transparent_panel = vim.g.background_transparency,
--             },
--             native_lsp = {
--                 enabled = true,
--                 virtual_text = {
--                     errors = "italic",
--                     hints = "italic",
--                     warnings = "italic",
--                     information = "italic"
--                 },
--                 underlines = {
--                     errors = "underline",
--                     hints = "underline",
--                     warnings = "underline",
--                     information = "underline"
--                 }
--             },
--             -- 后面我们自己会手动设置
--             lsp_saga = false
--         }
--     }
-- )
--
 -- 应用主题
vim.cmd([[colorscheme edge]])
