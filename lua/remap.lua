local crates = require("crates")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Lex)
vim.keymap.set("n", "<leader>cf", crates.show_features_popup)
vim.keymap.set("n", "<leader>cv", crates.show_versions_popup)
vim.keymap.set("i", "<C-j>", "copilot#Accept('<CR>')", { silent = true, expr = true, replace_keycodes = false })
vim.keymap.set("n", "<leader>ff", function() require('telescope.builtin').find_files() end)
vim.keymap.set("n", "<leader>fl", function() require('telescope.builtin').live_grep() end)
