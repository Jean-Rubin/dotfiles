local fn = vim.fn
local execute = vim.api.nvim_command

--- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd 'packadd packer.nvim'
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)

    --- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    --- Basic plugins
    use {'tpope/vim-surround'}
    use {'tpope/vim-repeat'}
    use {'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'} -- File icons
    }
    use {'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true} -- File icons
    }
    use {'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }
    use {'jalvesaq/vimcmdline'}
    use {'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {'nvim-lua/plenary.nvim'}
    }
    use {'numToStr/Comment.nvim'}
    use {'folke/which-key.nvim'}
    use {'phaazon/hop.nvim',
        branch = 'v2'
    }
    use {'windwp/nvim-autopairs'}
    use {'Wansmer/treesj',
        requires = {'nvim-treesitter'}
    }

    --- Snippets
    use {'L3MON4D3/LuaSnip'}

    --- LSP
    use {'neovim/nvim-lsp'}
    use {'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim',
            'saadparwaiz1/cmp_luasnip',
            'kdheepak/cmp-latex-symbols'
        },
        sources = {
            { name = 'latex_symbols' }
        }
    }
    use {'weilbith/nvim-code-action-menu'}
    use {'ray-x/lsp_signature.nvim'}

    --- Treesitter
    use {'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            --'nvim-treesitter/nvim-treesitter-refactor', -- Redundant with LSP functions
            'nvim-treesitter/playground',
            'p00f/nvim-ts-rainbow'
        },
        run = ':TSUpdate'
    }
    use {'lukas-reineke/indent-blankline.nvim'}

    --- Debugging
    use {'mfussenegger/nvim-dap'}
    use {'rcarriga/nvim-dap-ui',
        requires = {'mfussenegger/nvim-dap'}
    }

    --- Latex
    use {'lervag/vimtex'}

    --- R
    use {'jalvesaq/Nvim-R'}

    --- Wiki
    use {'vimwiki/vimwiki'}

    --- Miscellaneous
    use {'junegunn/vim-easy-align'}
    use {'norcalli/nvim-colorizer.lua'}

end)
