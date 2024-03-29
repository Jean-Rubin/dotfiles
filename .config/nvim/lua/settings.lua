local indent = 4

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
vim.opt.mouse          = 'a'                   -- Enable mouse usage (all modes)
vim.opt.showmode       = false                 -- Don't display current mode in last line
vim.opt.ignorecase     = true                  -- Do case insensitive matching
vim.opt.smartcase      = true                  -- Do smart case matching
vim.opt.gdefault       = true                  -- Pattern use the g flag by default
vim.opt.lazyredraw     = true                  -- Faster redraw, no screen draw when executing macros
vim.opt.ttimeoutlen    = 0                     -- No waiting for esc to go back to normal mode
vim.opt.updatetime     = 1000                  -- CursorHold timeout value
vim.opt.wrap           = true                  -- Allow long lines to wrap
vim.opt.scrolloff      = 5                     -- Minimal screen size above or below the cursor
vim.opt.clipboard      = "unnamed,unnamedplus" -- Clipboard on normal yank
vim.opt.swapfile       = false                 -- No swap files
vim.opt.cursorline     = true                  -- Set cursor line
vim.opt.guicursor      = "n-v-c-sm:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr-o:hor20-Cursor/lCursor" -- Use Cursor highlight instead of the default terminal one

--- Splits
vim.opt.splitbelow     = true                  -- Open new split panes below
vim.opt.splitright     = true                  -- Open new split panes to the right

--- Softtabs
vim.opt.tabstop        = indent
vim.opt.shiftwidth     = indent
vim.opt.expandtab      = true                  -- Insert spaces instead of tab character when tab is pressed
vim.opt.softtabstop    = indent                -- See multiple space characters as tabstops
vim.opt.smartindent    = true

--- Numbers
vim.opt.number         = true                  -- Display line numbers
vim.opt.relativenumber = true                  -- Line numbers are relative to cursor postion
vim.opt.numberwidth    = 3                     -- Width of the number column

--- Folding
vim.opt.foldlevelstart = 5                     -- Folds are closed after some levels
vim.opt.foldlevel      = 5                     -- Folds are closed after some levels
vim.opt.foldmethod     = "indent"              -- Folds are based on indent levels

--- Wildmenu
vim.opt.wildignore     = "*.aux,*.log,*.out,*.pdf,*.bmp, *.gif,*.ico,*.jpg,*.png,*.swp,*.tmp" --Files to ignore

--- Programs
vim.opt.grepprg        = "rg --hidden --vimgrep --smart-case --"

-- Status Line
vim.opt.laststatus     = 3                     -- Global status line
vim.opt.winbar         = "%=%m%f"

--- Skeleton files
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*",
	command = "silent! 0r ~/.config/nvim/skel/template.%:e"
})

--- Highlight after yank
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank {timeout = 100}
    end
})

--- Custom fix on ocaml
vim.cmd 'autocmd BufRead,BufNewFile *.mli set ft=ocaml_interface'
