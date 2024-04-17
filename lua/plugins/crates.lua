return {
	"saecki/crates.nvim",
	tag = "stable",
	config = function()
		require("crates").setup({
			popup = {
				autofocus = true
			}
		})

		local crates = require("crates")
		vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "Show features popup" })
		vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { desc = "Show versions popup" })
	end,
}
