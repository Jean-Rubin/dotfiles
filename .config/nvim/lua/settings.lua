local utils = require('utils')

local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('o', 'mouse', 'a')                       -- Enable mouse usage (all modes)
utils.opt('o', 'ignorecase', true)                 -- Do case insensitive matching
utils.opt('o', 'smartcase', true)                  -- Do smart case matching
utils.opt('o', 'gdefault', true)                   -- Pattern use the g flag by default
utils.opt('o', 'inccommand', 'nosplit')            -- Substitutions appear dynamically
utils.opt('o', 'lazyredraw', true)                 -- Faster redraw, no screen draw when executing macros
utils.opt('o', 'ttimeoutlen', 0)                   -- No waiting for esc to go back to normal mode
utils.opt('o', 'updatetime', 1000)                 -- CursorHold timeout value
utils.opt('o', 'scrolloff', 5)                     -- Minimal screen size above or below the cursor
utils.opt('o', 'wrap', true)                       -- Line wrapping
utils.opt('o', 'clipboard', 'unnamed,unnamedplus') -- Clipboard on normal yank
utils.opt('o', 'hidden', true)                     -- Hide buffers when they are abandoned
utils.opt('b', 'swapfile', false)                  -- No swap files

--- Splits
utils.opt('o', 'splitbelow', true)                 -- Open new split panes below
utils.opt('o', 'splitright', true)                 -- Open new split panes to the right

--- Softtabs
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'expandtab', true)                  -- Insert spaces instead of tab character when tab is pressed
utils.opt('b', 'softtabstop', indent)              -- See multiple space characters as tabstops
utils.opt('b', 'smartindent', true)

--- Numbers
utils.opt('w', 'number', true)                     -- Display line numbers
utils.opt('w', 'relativenumber', true)             -- Line numbers are relative to cursor postion
utils.opt('w', 'numberwidth', 3)                   -- Width of the number column

--- Folding
utils.opt('o', 'foldlevelstart', 5)                -- Folds are closed after some levels
utils.opt('o', 'foldlevel', 5)                     -- Folds are closed after some levels
utils.opt('w', 'foldmethod', 'indent')             -- Folds are based on indent levels

--- Wildmenu
utils.opt('o', 'wildignore',
    [[*.aux,*.log,*.out,*.pdf,*.bmp,
      *.gif,*.ico,*.jpg,*.png,*.swp,*.tmp]])       -- Files to ignore

--- Skeleton files
vim.cmd 'autocmd BufNewFile * silent! 0r ~/.config/nvim/skel/template.%:e'

--- Inactive windows dimming
-- vim.cmd 'hi ActiveWindow guibg=#17252c'
-- vim.cmd 'hi InactiveWindow guibg=#1b2b34'
-- vim.cmd 'au WinEnter * setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow'

--- Highlight after yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {timeout = 100}'

--- Custom fix on ocaml
-- vim.cmd 'autocmd BufRead,BufNewFile *.mli set ft=ocaml_interface'
vim.cmd 'autocmd BufRead,BufNewFile *.mli TSBufDisable highlight'
-- vim.cmd [[let g:opamshare = substitute(system('opam var share'),'\n$','','''')
--      execute "set rtp+=" . g:opamshare . "/merlin/vim"]]
