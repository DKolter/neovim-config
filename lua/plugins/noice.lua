return {
  "folke/noice.nvim",
  opts = {
    presets = {
      lsp_doc_border = true,
    },
    routes = {
      {
        filter = {
          event = "notify",
          error = true,
          find = "Invalid offset LineCol",
        },
        opts = { skip = true },
      },
    },
  },
}
