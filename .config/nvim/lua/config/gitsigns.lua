local wk = require('which-key')

require('gitsigns').setup {
    signs = {
        delete = {hl = 'GitSignsDelete', text = '▁', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn', show_count = true },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ';h', function()
            if vim.wo.diff then return ';h' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', ',h', function()
            if vim.wo.diff then return ',h' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})
        -- map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        -- map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        -- map('n', '<leader>hS', gs.stage_buffer)
        -- map('n', '<leader>hu', gs.undo_stage_hunk)
        -- map('n', '<leader>hR', gs.reset_buffer)
        -- map('n', '<leader>hp', gs.preview_hunk)
        -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        -- map('n', '<leader>tb', gs.toggle_current_line_blame)
        -- map('n', '<leader>hd', gs.diffthis)
        -- map('n', '<leader>hD', function() gs.diffthis('~') end)
        -- map('n', '<leader>td', gs.toggle_deleted)
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}

wk.register {
    ["<leader>h"] = {
        name = "hunk",
        s = {'<cmd>lua require"gitsigns".stage_hunk()<CR>', 'Stage Hunk'},
        u = {'<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', 'Unstage Hunk'},
        r = {'<cmd>lua require"gitsigns".reset_hunk()<CR>', 'Reset Hunk'},
        R = {'<cmd>lua require"gitsigns".reset_buffer()<CR>', 'Reset Buffer'},
        p = {'<cmd>lua require"gitsigns".preview_hunk()<CR>', 'Preview Hunk'},
        b = {'<cmd>lua require"gitsigns".blame_line()<CR>', 'Blame Line'},
        d = {'<cmd>lua require"gitsigns".diffthis()<CR>', 'Diff this'},
        D = {'<cmd>lua require"gitsigns".diffthis("~")<CR>', 'Diff this'}
    }
}
