return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    -- disable the warning from pyright, we use pylint instead.
    handlers = {
        ---@diagnostic disable-next-line: unused-vararg
        ["textDocument/publishDiagnostics"] = function(...)
        end
    },
    -- basic setting
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off"
            }
        }
    }
}
