return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", "<cmd>Oil --float<CR>", { desc = "Open floating explorer" })
		require("oil").setup({
			keymaps = {
				["<BS>"] = "actions.parent",
				["q"] = "actions.close",
			},
		})
	end,
}
