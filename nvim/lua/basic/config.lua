-- TODO:read the lua syntax detail, and findout how to move our vimscipt to it
-- like how to run a code and debug etc.

vim.cmd([[colorscheme dracula]])
vim.g.background_transparency = true
vim.g.undotree_dir = "~/.cache/nvim/undodir"
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet"
-- NOTE: setting the dap python here
vim.g.python_path = "/home/aikenhong/anaconda3/bin/python"

-- FIX: we can only change the theme in the github configs
-- maybe with the order of install the plugins
-- but we need to find out how to solve this
-- vim.cmd([[colorscheme catppuccin]])

-- Add header for those langs we usually code.
vim.cmd('autocmd BufNewFile *.md,*.sh,*.cpp,*.py,*.lua exec ":lua set_title()"')
function set_title()
    filetype = vim.fn.expand("%:e")
    -- set title for markdown
    if filetype == "md" then
        vim.fn.setline("1", "---")
        vim.fn.append(vim.fn.line("."), "title: " .. vim.fn.expand("%"))
        vim.fn.append(vim.fn.line(".")+1, "catalog: true")
        vim.fn.append(vim.fn.line(".")+2, "subtitle: ")
        vim.fn.append(vim.fn.line(".")+3, "date: " .. os.date("%Y-%m-%d %H:%M:%S  "))
        vim.fn.append(vim.fn.line(".")+4, "lang: cn")
        vim.fn.append(vim.fn.line(".")+5, "header-img: /img/header_img/lml_bg1.jpg")
        vim.fn.append(vim.fn.line(".")+6, "tag: ")
        vim.fn.append(vim.fn.line(".")+7, "-  ")
        vim.fn.append(vim.fn.line(".")+8, "categories: ")
        vim.fn.append(vim.fn.line(".")+9, "-  ")
        vim.fn.append(vim.fn.line(".")+10, "mathjax: true")
        vim.fn.append(vim.fn.line(".")+11, "sticky: ")
        vim.fn.append(vim.fn.line(".")+12, "")
        vim.fn.append(vim.fn.line(".")+13, "---")

    elseif filetype == "cpp" then
        vim.fn.setline("1", "/*")
        vim.fn.append(vim.fn.line("."), "Signature auto created by nvim")
        vim.fn.append(vim.fn.line(".")+1, "@Author: AikenHong")
        vim.fn.append(vim.fn.line(".")+2, "@Mail: h.aiken.970@gmail.com")
        vim.fn.append(vim.fn.line(".")+3, "@Date: " .. os.date("%Y-%m-%d %H:%M:%S"))
        vim.fn.append(vim.fn.line(".")+4, "@Desc: ")
        vim.fn.append(vim.fn.line(".")+5, "*/")
        vim.fn.append(vim.fn.line(".")+6, "#include <iostream>")
        vim.fn.append(vim.fn.line(".")+7, "#include <string>")
        vim.fn.append(vim.fn.line(".")+8, "#include <algorithm>")
        vim.fn.append(vim.fn.line(".")+9, "#include <vector>")
        vim.fn.append(vim.fn.line(".")+10, "#include <map>")
        vim.fn.append(vim.fn.line(".")+11, "#include <set>")
        vim.fn.append(vim.fn.line(".")+12, "#include <queue>")
        vim.fn.append(vim.fn.line(".")+13, "#include <stack>")
        vim.fn.append(vim.fn.line(".")+14, "#include <cmath>")
        vim.fn.append(vim.fn.line(".")+15, "#include <list>")
        vim.fn.append(vim.fn.line(".")+16, "")
        vim.fn.append(vim.fn.line(".")+17, "using namespace std;")
        vim.fn.append(vim.fn.line(".")+18, "")

    elseif filetype == 'py' then
        vim.fn.setline("1", "\"\"\"")
        vim.fn.append(vim.fn.line("."), "Signature auto created by nvim")
        vim.fn.append(vim.fn.line(".")+1, "@Author: AikenHong")
        vim.fn.append(vim.fn.line(".")+2, "@Mail: h.aiken.970@gmail.com")
        vim.fn.append(vim.fn.line(".")+3, "@Date: " .. os.date("%Y-%m-%d %H:%M:%S"))
        vim.fn.append(vim.fn.line(".")+4, "@Desc: ")
        vim.fn.append(vim.fn.line(".")+5, "\"\"\"")
        vim.fn.append(vim.fn.line(".")+6, "")
        vim.fn.append(vim.fn.line(".")+7, "import numpy as np")
        vim.fn.append(vim.fn.line(".")+8, "import os")

    elseif filetype == 'sh' then
        vim.fn.setline("1", "#!/bin/bash")
        vim.fn.append(vim.fn.line("."), "# " .. vim.fn.expand("%"))
        vim.fn.append(vim.fn.line(".")+1, "# Author: AikenHong")
        vim.fn.append(vim.fn.line(".")+2, "# Mail: h.aiken.970@gmail.com")
        vim.fn.append(vim.fn.line(".")+3, "# Date: " .. os.date("%Y-%m-%d %H:%M:%S"))
        vim.fn.append(vim.fn.line(".")+4, "# Desc: ")
        vim.fn.append(vim.fn.line(".")+5, "")

    elseif filetype == 'lua' then
        vim.fn.setline("1", "--[[")
        vim.fn.append(vim.fn.line("."), "Signature auto created by nvim")
        vim.fn.append(vim.fn.line(".")+1, "@Author: AikenHong")
        vim.fn.append(vim.fn.line(".")+2, "@Mail:h.aiken.970@gmail.com")
        vim.fn.append(vim.fn.line(".")+3, "@Date: " .. os.date("%Y-%m-%d %H:%M:%S"))
        vim.fn.append(vim.fn.line(".")+4, "@Desc: ")
        vim.fn.append(vim.fn.line(".")+5, "]]")
    end
end

-- compile and run script directly without dap by Ctrl-F5
function CompileRunFiles()
    filetype = vim.fn.expand("%:e")
    vim.cmd(":w")
    if filetype == "cpp" then
        vim.cmd(":!g++ -std=c++2a -Wall -Wextra -Werror -o a.out *.cpp")
        vim.cmd(":!./a.out")
        vim.cmd(":!rm a.out")

    elseif filetype == "py" then
        vim.cmd(":!python %")

    elseif filetype == "sh" then
        vim.cmd(":!sh %")

    end
end
-- register it in the which key
vim.keybinds.gmap("", "<leader>lr", ":lua CompileRunFiles()<CR>", vim.keybinds.opts)
