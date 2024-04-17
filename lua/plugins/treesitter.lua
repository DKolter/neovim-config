return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c", "cpp", "lua", "vim", "vimdoc", "javascript", "html", "wgsl",
				"rust", "toml", "json", "python", "java", "css", "bash",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
