require("nvim-tree").setup({
    diagnostics = {
        enable = true,
    },
    filters = {
        dotfiles = false,
        git_ignored = false,
    },
})
