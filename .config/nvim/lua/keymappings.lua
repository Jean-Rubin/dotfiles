--- Fast move between splits
vim.keymap.set('n', "<C-h>", "<C-w><C-h>")
vim.keymap.set('n', "<C-j>", "<C-w><C-j>")
vim.keymap.set('n', "<C-k>", "<C-w><C-k>")
vim.keymap.set('n', "<C-l>", "<C-w><C-l>")

--- Terminal navigation
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>")
vim.keymap.set('t', "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set('t', "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set('t', "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set('t', "<C-l>", "<C-\\><C-n><C-w>l")

--- Fast move between tabs
vim.keymap.set('n', "<A-l>", "gt")
vim.keymap.set('n', "<A-h>", "gT")

--- Fast move between buffers
vim.keymap.set('n', "<Tab>", "<cmd>bnext<cr>", { silent = true })
vim.keymap.set('n', "<S-Tab>", "<cmd>bprevious<cr>", { silent = true })

--- Easier resize
vim.keymap.set('n', "<C-Left>", "<cmd>vertical resize -5<cr>", { silent = true })
vim.keymap.set('n', "<C-Right>", "<cmd>vertical resize +5<cr>", { silent = true })
vim.keymap.set('n', "<C-Up>", "<cmd>resize +5<cr>", { silent = true })
vim.keymap.set('n', "<C-Down>", "<cmd>resize -5<cr>", { silent = true })

--- Easier block indentation
vim.keymap.set('v', "<", "<gv")
vim.keymap.set('v', ">", ">gv")

--- Clear highlighting match quicker
vim.keymap.set('n', "<esc><esc>", "<cmd>noh<cr>", { silent = true })

--- Folding
vim.keymap.set('n', "<BS>", "za")

--- Edit vimrc/zshrc and load vimrc bindings
vim.keymap.set('n', "<leader>ez", "<cmd>vsp ~/.zshrc.local<cr>", { desc = "Edit Zsh running config" })
vim.keymap.set('n', "<leader>ec", "<cmd>tabe ~/.config/nvim/lua<cr>", { desc = "Edit Neovim lua config" })

--- Save Session
vim.keymap.set('n', "<leader>ss", "<cmd>mksession<cr>")

--- Highlight group helper
-- trans is transparent highlight group
-- lo is for inherited highlighting
vim.keymap.set('n', '<leader><F1>', [[<cmd>echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")."> trans<".synIDattr(synID(line("."),col("."),0),"name")."> lo<".synIDattr(synIDtrans(synID(line("."),col("."),1)),"name").">"<cr>]], { silent = true, noremap = false })
