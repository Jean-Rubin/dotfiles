-- local utils = require('utils')
local wk = require('which-key')

require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    update_to_buf_dir   = {
        enable = true,
        auto_open = true,
    },
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    diagnostics         = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    view = {
        width = 30,
        height = 30,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
        }
    },
    filters = {
        dotfiles = false,
        custom = {'.git', 'node_modules', '.cache'}
    }
}

-- utils.map('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>')
-- utils.map('n', '<leader>tf', '<cmd>NvimTreeFindFile<CR>')

wk.register {
    ["<leader>t"] = {
        name = 'tree',
        t = {'<cmd>NvimTreeToggle<cr>', 'Toggle Tree'},
        f = {'<cmd>NvimTreeFindFile<cr>', 'Find File in Tree'}
    }
}

