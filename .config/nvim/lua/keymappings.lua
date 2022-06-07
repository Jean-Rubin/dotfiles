local utils = require('utils')

--- Fast move between splits
utils.map('n', '<C-h>', '<C-w><C-h>')
utils.map('n', '<C-j>', '<C-w><C-j>')
utils.map('n', '<C-k>', '<C-w><C-k>')
utils.map('n', '<C-l>', '<C-w><C-l>')

--- Terminal navigation
utils.map('t', '<Esc>', '<C-\\><C-n>')
utils.map('t', '<C-h>', '<C-\\><C-n><C-w>h')
utils.map('t', '<C-j>', '<C-\\><C-n><C-w>j')
utils.map('t', '<C-k>', '<C-\\><C-n><C-w>k')
utils.map('t', '<C-l>', '<C-\\><C-n><C-w>l')


--- Fast move between tabs
utils.map('n', '<A-l>', 'gt')
utils.map('n', '<A-h>', 'gT')

--- Fast move between buffers
utils.map('n', '<Tab>', '<cmd>bnext<cr>', {silent = true})
utils.map('n', '<S-Tab>', '<cmd>bprevious<cr>', {silent = true})

--- Easier resize
utils.map('n', '<C-Left>', '<cmd>vertical resize -5<cr>', {silent = true})
utils.map('n', '<C-Right>', '<cmd>vertical resize +5<cr>', {silent = true})
utils.map('n', '<C-Up>', '<cmd>resize +5<cr>', {silent = true})
utils.map('n', '<C-Down>', '<cmd>resize -5<cr>', {silent = true})

--- Easier block indentation
utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')

--- Clear highlighting match quicker
utils.map('n', '<esc><esc>', '<cmd>noh<cr>', {silent = true})

--- Folding
utils.map('n', '<BS>', 'za')

--- Edit vimrc/zshrc and load vimrc bindings
utils.map('n', '<leader>ez', '<cmd>vsp ~/.zshrc.local<cr>')
utils.map('n', '<leader>es', '<cmd>tabe ~/.config/nvim/lua<cr>')

--- Save Session
utils.map('n', '<leader>ss', '<cmd>mksession<cr>')

--- Highlight group helper
-- trans is transparent highlight group
-- lo is for inherited highlighting
utils.map('n', '<leader><F1>', [[<cmd>echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")."> trans<".synIDattr(synID(line("."),col("."),0),"name")."> lo<".synIDattr(synIDtrans(synID(line("."),col("."),1)),"name").">"<cr>]], {silent = true, noremap = false})
