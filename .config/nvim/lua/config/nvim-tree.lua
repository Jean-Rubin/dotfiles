-- local utils = require('utils')
local wk = require('which-key')

require'nvim-tree'.setup {
    disable_netrw = true,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true
    },
    view = {
        width = 30,
        side = 'left',
        -- auto_resize = false,
        mappings = {
            list = {
                { key = "tg", action = "toggle_git"},
                { key = "td", action = "toggle_dotfiles"}
            }
        }
    },
    filters = {
        dotfiles = true,
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

