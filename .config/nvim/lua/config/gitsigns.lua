local wk = require('which-key')

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ;h'] = { expr = true, "&diff ? ';h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n ,h'] = { expr = true, "&diff ? ',h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    -- ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    -- ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    -- ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    -- ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    -- ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    -- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_internal_diff = true,  -- If luajit is present
}

wk.register {
    ["<leader>h"] = {
        name = "hunk",
        s = {'<cmd>lua require"gitsigns".stage_hunk()<CR>', 'Stage Hunk'},
        u = {'<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', 'Unstage Hunk'},
        r = {'<cmd>lua require"gitsigns".reset_hunk()<CR>', 'Reset Hunk'},
        R = {'<cmd>lua require"gitsigns".reset_buffer()<CR>', 'Reset Buffer'},
        p = {'<cmd>lua require"gitsigns".preview_hunk()<CR>', 'Preview Hunk'},
        b = {'<cmd>lua require"gitsigns".blame_line()<CR>', 'Blame Line'}
    }
}

