vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cf", function() require("crates").show_features_popup() end)
vim.keymap.set("n", "<leader>cv", function() require("crates").show_versions_popup() end)
vim.keymap.set("i", "<C-j>", "copilot#Accept('<CR>')", { silent = true, expr = true, replace_keycodes = false })
vim.keymap.set("n", "<leader>ff", function() require('telescope.builtin').find_files() end)
vim.keymap.set("n", "<leader>fg", function() require('telescope.builtin').git_files() end)
vim.keymap.set("n", "<leader>fl", function() require('telescope.builtin').live_grep() end)
vim.keymap.set("n", "<leader>e", function() require("nvim-tree.api").tree.toggle() end)
vim.keymap.set("n", "<leader>cc", function()
    local file = vim.fn.findfile("meson.build", ".;")
    file = vim.fn.fnamemodify(file, ":p:h")
    local cmd = 'cd "' .. file .. '"'
    if vim.fn.isdirectory(file .. "/build") == 0 then
        cmd = cmd .. "; meson setup build"
    end

    cmd = cmd .. "; cd build; ninja; ./output"
    os.execute(cmd)
    -- require("nvterm.terminal").send(cmd .. "\r")
end)
