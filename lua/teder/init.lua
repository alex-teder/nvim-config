vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("teder.lazynvim")

-- theme
vim.cmd.colorscheme "catppuccin"

-- sets
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.updatetime = 50

-- remaps
vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("x", "<leader>p", "\"_dP")

local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- toggle file tree
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true })

-- show lsp error 
vim.keymap.set(
    "n", 
    "<leader><space>", 
    ":lua vim.diagnostic.open_float()<CR>", 
    { silent = true }
)

vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { silent = true })

vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", {})
