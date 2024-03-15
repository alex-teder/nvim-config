require("nvim-tree").setup({
    view = { adaptive_size = true },
    renderer = { highlight_diagnostics = "all" },
    update_focused_file = { enable = true },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
})

