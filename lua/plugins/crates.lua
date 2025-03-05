require("which-key").add({ "<leader>r", group = "rust" })

return {
  "saecki/crates.nvim",
  opts = {
    popup = {
      autofocus = true,
    },
  },
  keys = {
    { "<leader>rv", "<cmd>Crates show_versions_popup<cr>", desc = "Show rust crate versions", ft = "toml" },
    { "<leader>rf", "<cmd>Crates show_features_popup<cr>", desc = "Show rust crate features", ft = "toml" },
  },
}
