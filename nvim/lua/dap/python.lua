-- python3 -m pip install debugpy
-- we use vim.g.python_path to control the version of our dap python
-- we setting this in the conf files 

return {
    adapters = {
        type = "executable",
        command = "python3",
        args = {"-m", "debugpy.adapter"}
    },
    configurations = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            pythonPath = function()
                return vim.g.python_path
            end
        }
    }
}
