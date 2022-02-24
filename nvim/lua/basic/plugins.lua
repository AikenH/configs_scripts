---@diagnostic disable: undefined-global
-- https://github.com/wbthomason/packer.nvim
local packer = require("packer")
packer.startup(
    {
        -- 所有插件的安装都书写在 function 中
        function()
            -- Package manager
            use {
                "wbthomason/packer.nvim"
            }

            -- Install Chinese Doc Plugins for vim
            use {
                "yianwillis/vimcdoc",
            }

            -- FileTree is very important
            use {
                "kyazdani42/nvim-tree.lua",
                requires = {
                    -- need icon plugins
                    "kyazdani42/nvim-web-devicons",
                },
                config = function()
                    -- after loading the plugin we run this code below
                    require("conf.nvim-tree")
                end
            }

            -- Gitigns line setting
            use {
                "lewis6991/gitsigns.nvim",
                requires = {
                    "nvim-lua/plenary.nvim"
                },
                config = function()
                    require("conf.gitsigns")
                end
            }

            -- Better Status bar plugins
            use {
                "windwp/windline.nvim",
                config = function()
                    require("wlsample.bubble")
                end
            }

            -- This icon fix the problem icon not show for bufferline
            use {
                "kyazdani42/nvim-web-devicons"
            }

            -- BufferLine support
            use {
                "akinsho/bufferline.nvim",
                requires = {
                    "kyazdani42/nvim-web-devicons",
                    "famiu/bufdelete.nvim",
                },
                config = function()
                    require("conf.bufferline")
                end
            }

            --NOTE: Themes for nvim
            use {
                "catppuccin/nvim",
                as = "catppuccin",
                config = function()
                    require("conf.catppuccin")
                end
            }

            use {
                "sainnhe/edge",
                opt = false,
                config = function()
                    require("conf.nvim-edge")
                end
            }

            use {
                "projekt0n/github-nvim-theme",
                config = function()
                    require("conf.github-nvim-theme")
                end
            }

            use {
                "sainnhe/sonokai",
                config = function() 
                    require("conf.sonokai")
                end
            }

            -- Using airline to replace  buffline and status bar
            -- but seems the buffline even worse ,so we return to buff + status
            --use {
            --    "vim-airline/vim-airline",
            --    requires = {
            --        "vim-airline/vim-airline-themes",
            --        "ryanoasis/vim-devicons"
             --   },
            --    config = function()
            --        require("conf.airline")
            --    end
            --}

            -- augmente the searching function
            use {
                "kevinhwang91/nvim-hlslens",
                config = function()
                    require("conf.nvim-hlslens")
                end
            }

            -- show the indent line for ez visual
            use {
               "lukas-reineke/indent-blankline.nvim",
                config = function()
                    require("conf.indent-blankline")
                end
            }

            -- add autopairs for nvim
            use {
                "windwp/nvim-autopairs",
                config = function()
                    require("conf.nvim-autopairs")
                end
            }

            -- add the syn-hl for nvim
            use {
                'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate',
                requires = {
                    "p00f/nvim-ts-rainbow"
                },
                config = function()
                    require("conf.nvim-treesitter")
                end
            }

            -- add Todo Plugins
            -- need true color to show color correctly
            use {
                "folke/todo-comments.nvim",
                requires = "nvim-lua/plenary.nvim",
                config = function()
                    require("conf.todo-comments")
                end
            }

            -- Config the telescope.nvim
            use {
                "nvim-telescope/telescope.nvim",
                requires = {
                    "nvim-lua/plenary.nvim",
                    "nvim-lua/popup.nvim",
                    "BurntSushi/ripgrep",
                    "sharkdp/fd",
                },
                config = function()
                    require("conf.telescope")
                end
            }

            -- add scrollbar for editor
            use {
                "petertriho/nvim-scrollbar",
                event = "BufRead",
                config = function()
                    require("conf.scrollbar")
                end
            }

            -- add visualize of the color code
            use {
                "norcalli/nvim-colorizer.lua",
                config = function()
                    require("conf.nvim-colorizer")
                end
            }

            -- autosave file for keep code safe
            use {
                "Pocco81/AutoSave.nvim",
                config = function()
                    require("conf.AutoSave")
                end
            }

            -- undo buffer which can keep u or C-R after close file
            use {
                "mbbill/undotree",
                config = function()
                    require("conf.undotree")
                end
            }

            -- better notify for nvim which is floap
            use {
                "rcarriga/nvim-notify",
                config = function()
                    require("conf.nvim-notify")
                end
            }

            -- dashboard to replace the strify page
            use {
                "glepnir/dashboard-nvim",
                opt = true,
                event = "BufWinEnter",
                config = function()
                    require("conf.dashboard")
                end
            }

            -- markdown preview for nvim( which is wrote by vimscript)
            use {
                "iamcco/markdown-preview.nvim",
                opt = true,
                ft = "markdown",
                run = "cd app && yarn install"
            }

            -- using the multiple-cursors (old version plugins )
            use {
                "terryma/vim-multiple-cursors",
                require = function()
                    require("conf.multi-cursors")
                end
            }

            -- TODO: finish our key mapping set of whichkey
            -- vim-whichkey
            use {
                "folke/which-key.nvim",
                config = function()
                    require("conf.which-key")
                end
            }

            -- augmentation wildmenu
            use {
                "gelguy/wilder.nvim",
                event = "CmdlineEnter",
                requires = {
                    "romgrk/fzy-lua-native",
                },
                config = function()
                    require("conf.wilder")
                end
            }

            -- hightlight the cursor word
            use {
                "itchyny/vim-cursorword",
                opt = true,
                event = { "BufReadPre", "BufNewFile" },
                config = function()
                    require("conf.nvim-cursorword")
                end
            }

            -- improve the terminal
            use {
                "akinsho/toggleterm.nvim",
                config = function()
                    require('conf.toggleterm')
                end
            }

            -- ez comment
            use {
                "terrortylor/nvim-comment",
                config = function()
                    require("conf.nvim-comment")
                end
            }

            -- NOTE: LSP configuration Localization
            -- support lsp
            use {
                "neovim/nvim-lspconfig",
                config = function()
                    require("conf.nvim-lspconfig")
                end
            }

            -- install lsp we require automatic
            use {
                "williamboman/nvim-lsp-installer",
                config = function()
                    require("conf.nvim-lsp-installer")
                end
            }

            -- make lsp ui better
            use {
                "tami5/lspsaga.nvim",
                branch = 'nvim6.0',
                config = function()
                    require("conf.lspsaga")
                end
            }

            -- show the loading status of lsp
            use {
                "j-hui/fidget.nvim",
                config = function()
                    require("conf.fidget")
                end
            }

            -- signature in insert mode of lsp
            use {
                "ray-x/lsp_signature.nvim",
                config = function()
                    require("conf.lsp-signature")
                end
            }

            -- recommand some action for some problem code
            -- like not definded or not import libs can be automatic add
            use {
                "kosayoda/nvim-lightbulb",
                config = function()
                    require("conf.nvim-lightbulb")
                end

            }

            -- NOTE: auto complete plugins in nvim using tabnine and vsnip
            use {
                "hrsh7th/nvim-cmp",
                requires = {
                    {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
                    {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
                    {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
                    {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
                    {"hrsh7th/cmp-path"}, -- 路径补全
                    {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
                    {"hrsh7th/cmp-cmdline"}, -- 命令补全
                    {"f3fora/cmp-spell"}, -- 拼写建议
                    {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
                    {"lukas-reineke/cmp-under-comparator"}, -- 让补全结果的排序更加智能
                    {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
                },
                config = function()
                    require("conf.nvim-cmp")
                end
            }

            -- FIXME: github copilot can not been use in wsl which becus the web can not open
            -- -- Github Copilot support
            -- use {
            --     "github/Copilot.vim",
            --     config = function()
            --         require("conf.copilot")
            --     end
            -- }

            -- NOTE: extend lint for some langs but having bug so we donot enable for now
            -- use {
            --     "mfussenegger/nvim-lint",
            --     config = function ()
            --         require("conf.nvim-lint")
            --     end
            -- }

            --outline
            use {
                "liuchengxu/vista.vim",
                config = function ()
                    require("conf.vista")
                end
            }

            -- NOTE: Editor helpers like surrounded or reverse meaning
            use {
                "AndrewRadev/switch.vim",
                config = function ()
                   require("conf.switch")
                end
            }

            -- FIXME: the surrounded's performance weird, need to find out how to setthis
            -- use {
            --     "ur4ltz/surround.nvim",
            --     config = function ()
            --         require("conf.surround")
            --     end
            -- }



        end,
        -- 使用浮动窗口
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)

-- 实时生效配置
vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
 )
