local dap = require('dap')

dap.adapters.julia = {
    type = 'executable',
    command = '/home/jean/.local/bin/julia',
    args = {'-e', [[
        using DebugAdapter;
    ]]}
}

dap.configurations.julia = {
  {
    -- The first three options are required by nvim-dap
    type = 'julia',
    request = 'launch',
    name = "Launch file"
  }
}
