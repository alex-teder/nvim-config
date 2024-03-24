vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("teder.lazynvim")

-- theme
vim.cmd.colorscheme "catppuccin"

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

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

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = 'Switch to Normal mode' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'move highlighted lines down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'move highlighted lines up' })

-- when scrolling keep cursor in the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("x", "<leader>p", "\"_dP")

local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Find file' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Grep in project' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', function() builtin.lsp_references({ show_line = false }) end,
{ noremap = true, silent = true, desc = 'Find references' })

vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true, desc = 'Toggle file tree' })

vim.keymap.set(
    "n", 
    "<leader><space>", 
    ":lua vim.diagnostic.open_float()<CR>", 
    { silent = true, desc = 'Show diagnostics message' }
)

vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { silent = true, desc = 'Next Hunk' })
vim.keymap.set("n", "<leader>gN", ":Gitsigns prev_hunk<CR>", { silent = true, desc = 'Previous Hunk' })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { silent = true, desc = 'Preview Hunk' })
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { silent = true, desc = 'Reset Hunk' })
vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", { silent = true, desc = 'Reset Buffer' })

vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { desc = 'Vertical split' })
