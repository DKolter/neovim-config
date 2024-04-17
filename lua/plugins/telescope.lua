return {
	"nvim-telescope/telescope.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local builtins = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtins.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fl", builtins.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>fh", builtins.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader>fd", builtins.diagnostics, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>fs", builtins.lsp_document_symbols, { desc = "Document symbols" })
		vim.keymap.set("n", "<leader>fw", builtins.lsp_workspace_symbols, { desc = "Workspace symbols" })
		vim.keymap.set("n", "<leader>fr", builtins.registers, { desc = "Registers" })
		vim.keymap.set("n", "<leader>fb", builtins.current_buffer_fuzzy_find, { desc = "Current buffer fuzzy find" })
		vim.keymap.set("n", "gd", builtins.lsp_definitions, { desc = "Goto definition" })
		vim.keymap.set("n", "gr", builtins.lsp_references, { desc = "Goto references" })
		vim.keymap.set("n", "gi", builtins.lsp_implementations, { desc = "Goto implementations" })
		vim.keymap.set("n", "gt", builtins.lsp_type_definitions, { desc = "Goto type definitions" })
		require("telescope").setup()
	end,
}
