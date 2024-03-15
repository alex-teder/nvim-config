local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable",
	lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "nvim-tree/nvim-tree.lua",
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "windwp/nvim-autopairs",
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {
      "ray-x/lsp_signature.nvim",
      event = "VeryLazy",
      opts = {},
      config = function(_, opts) require'lsp_signature'.setup(opts) end
    },
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    'MunifTanjim/prettier.nvim',
    {
        'nvim-treesitter/nvim-treesitter', 
        run = ':TSUpdate',
    },
    "windwp/nvim-ts-autotag",
    "lewis6991/gitsigns.nvim",
    'numToStr/Comment.nvim',
    'tpope/vim-fugitive',
}

require("lazy").setup(plugins)

