local wk = require('which-key')
require('dap')

vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})

require('dapui').setup()

wk.register {
    ['<leader>d'] = {
        name = 'debugger',
        d = {'<cmd>lua require("dap").toggle_breakpoint()<cr>', 'Toggle Breakpoint'},
        f = {'<cmd>lua require("dap").close()<cr>', 'Close'},
        s = {'<cmd>lua require("dap").continue()<cr>', 'Continue'},
        l = {'<cmd>lua require("dap").step_into()<cr>', 'Step Into'},
        j = {'<cmd>lua require("dap").step_over()<cr>', 'Step Over'},
        k = {'<cmd>lua require("dap").step_out()<cr>', 'Step Out'},
        r = {'<cmd>lua require("dap").repl.open({}, "vsplit")<cr>', 'Debug Repl'},
        u = {
            name = 'ui',
            u = {'<cmd> lua require("dapui").toggle()<cr>', 'Toggle DapUI'},
            h = {'<cmd>lua require("dapui").eval()<cr>', 'Debug Hover'},
            d = {'<cmd>lua require("dapui").float_element()<cr>', 'Debug Display'}
        }
    }
}

