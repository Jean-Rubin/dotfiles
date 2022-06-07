local dap = require('dap')

dap.adapters.r = {
    type = 'executable',
    command = '/usr/bin/Rscript',
    args = {'--slave', '-e', 'vscDebugger::.vsc.listen()'}
}

dap.configurations.r = {
  {
    -- The first three options are required by nvim-dap
    type = 'r',
    request = 'launch',
    name = "Launch R process",
    program = "${file}",
    ["r.rpath.xxx"] = "/usr/bin/R"
  }
}
