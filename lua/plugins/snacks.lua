return {
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
      dashboard = {
        sections = {
          vim.fn.executable("pokemon-colorscripts") and {
            section = "terminal",
            cmd = "pokemon-colorscripts -n pikachu --no-title; sleep .1",
            indent = 20,
          } or {
            section = "header",
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
