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

            -- NOTE: UI of Nvim like sidebars or themes
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
            -- use {
            --     "windwp/windline.nvim",
            --     config = function()
            --         require("wlsample.bubble")
            --     end
            -- }

            -- use {
            --     "feline-nvim/feline.nvim",
            --     requires = {
            --         "kyazdani42/nvim-web-devicons",
            --         "lewis6991/gitsigns.nvim",
            --     },
            --     config = function()
            --         require("conf.feline")
            --     end
            -- }

            use {
                "nvim-lualine/lualine.nvim",
                requires = {
                    "kyazdani42/nvim-web-devicons",
                    "lewis6991/gitsigns.nvim",
                    "SmiteshP/nvim-gps",
                },
                config = function()
                    require("conf.lualine")
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
                "mcchrish/zenbones.nvim",
                requires = "rktjmp/lush.nvim",
                config = function()
                    require("conf.zenbones")
                end
            }

            -- use {
            --     "projekt0n/github-nvim-theme",
            --     config = function()
            --         require("conf.github-nvim-theme")
            --     end
            -- }

            use {
                "sainnhe/sonokai",
                config = function()
                    require("conf.sonokai")
                end
            }

            use {
                "folke/tokyonight.nvim",
                config = function()
                    require("conf.tokyonight")
                end
            }

            use {
                "ellisonleao/gruvbox.nvim",
            }

            use{
                "folke/lsp-colors.nvim",
            }

            use {
                "Mofiqul/dracula.nvim",
                config = function()
                    require("conf.dracula")
                end
            }

            use {
                "rafamadriz/neon",
                config = function()
                    require("conf.neon")
                end
            }

            use {
                "shaunsingh/moonlight.nvim",
                config = function()
                    require("conf.moonlight")
                end
            }

            use {
                "navarasu/onedark.nvim",
                config = function()
                    require("conf.onedark")
                end
            }

            use {
                "Th3Whit3Wolf/space-nvim",
                config = function()
                    require("conf.space-nvim")
                end
            }

            -- align our code for better view
            -- TODO: need to be config for keybind (can we do this)?
            -- maybe we can config some regular type of it.
            use {
                "godlygeek/tabular",
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
                    "nvim-telescope/telescope-project.nvim",
                    -- "nvim-telescope/telescope-media-files.nvim"
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

            use {
                "ellisonleao/glow.nvim",
                config = function()
                    require("conf.glow")
                end
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

            -- NOTE: LSP configuration Localization and DAP settin
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

            -- TODO: findout how to use this before we install it.
            -- use {
            --     "Pocco81/DAPInstall.nvim",
            --     config = function()
            --         require("conf.DAPInstall")
            --     end
            -- }

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

            use {
                "mfussenegger/nvim-dap",
                config = function()
                    require("conf.nvim-dap")
                end
            }

            use {
                "theHamsta/nvim-dap-virtual-text",
                requires = {
                    "mfussenegger/nvim-dap"
                },
                config = function()
                    require("conf.nvim-dap-virtual-text")
                end

            }

            use {
                "rcarriga/nvim-dap-ui",
                requires = {
                    "mfussenegger/nvim-dap"
                },
                config = function()
                    require("conf.nvim-dap-ui")
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

            -- Github Copilot support
            use {
                "github/Copilot.vim",
                config = function()
                    require("conf.copilot")
                end
            }

            -- FIXME: extend lint for some langs but having bug so we donot enable for now
            use {
                "mfussenegger/nvim-lint",
                config = function ()
                    require("conf.nvim-lint")
                end
            }

            -- outline, may be update by the aerial.
            -- use {
            --     "liuchengxu/vista.vim",
            --     config = function ()
            --         require("conf.vista")
            --     end
            -- }

            use {
                "stevearc/aerial.nvim",
                config = function()
                    require("conf.aerial")
                end
            }

            -- NOTE: Editor helpers like surrounded or reverse meaning
            use {
                "AndrewRadev/switch.vim",
                config = function ()
                   require("conf.switch")
                end
            }

            use {
                "ur4ltz/surround.nvim",
                config = function ()
                    require("conf.surround")
                end
            }

            -- long screenshot of code
            use {
                "kristijanhusak/vim-carbon-now-sh",
                config = function()
                    require("conf.nvim-carbon-now-sh")
                end
            }

            -- auto session which save the windows for a project
            -- this one will conflicts with dashboard. so we donot use it for now
            -- we add a keymap to do this function.
            -- use{
            --     "rmagatti/auto-session",
            --     config = function()
            --         require("conf.auto-session")
            --     end
            -- }
           

            -- auto save the cursor pos for files
            use {
                "ethanholz/nvim-lastplace",
                config = function()
                    require("conf.lastplace")
                end
            }

            -- count the startup time for nvim, see what's problem/
            use {
                "dstein64/vim-startuptime",
            }

            -- -- TODO:using diff-vim to improve the vim-diff
            -- use {
            --     "sindrets/diffview.nvim",
            --     requires = {
            --         'nvim-lua/plenary.nvim',
            --     },
            --     config = function()
            --         require("conf.diffview")
            --     end
            -- }

            -- thi plugin cannot been used in the wsl2 so we enable this in terminal
            -- use {
            --     "karb42/neoscroll.nvim",
            --     config = function()
            --         require("conf.neoscroll")
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
