local utils = require("utils")

utils.opt('w', "conceallevel", 2)
vim.g.tex_conceal = "abdgm"
vim.cmd "hi Conceal ctermbg=none"
