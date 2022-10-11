local actions = require('telescope.actions')
-- local utils = require('utils')
local wk = require('which-key')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
            },
        },
        sorting_strategy = 'ascending',
        theme = 'dropdown',
        layout_config = {
            width = 0.9,
            height = 0.7,
            horizontal = {
                preview_width = 0.55,
            },
            prompt_position = 'top',
        }
    },
}

-- utils.map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
-- utils.map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
-- utils.map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
-- utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

wk.register {
    ['<leader>f'] = {
        name = 'find',
        f = {'<cmd>Telescope find_files<cr>', 'Find File' },
        lg = {'<cmd>Telescope live_grep<cr>', 'Live Grep' },
        b = {'<cmd>Telescope buffers<cr>', 'Find Buffer' },
        h = {'<cmd>Telescope help_tags<cr>', 'Find Help Docs'},
        q = {'<cmd>Telescope quickfix<cr>', 'Find Quickfix'},
        ['ds'] = {'<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', 'Find Document Symbols'},
        ['ws'] = {'<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<cr>', 'Find Workspace Symbols'},
        ['gc'] = {'<cmd>lua require("telescope.builtin").git_commits()<cr>', 'Find Git Commits'},
        ['gb'] = {'<cmd>lua require("telescope.builtin").git_branches()<cr>', 'Find Git Commits'},
        ['gs'] = {'<cmd>lua require("telescope.builtin").git_status()<cr>', 'Find Git Status'}
    }
}
