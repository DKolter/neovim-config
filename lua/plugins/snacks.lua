return {
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
      dashboard = {
        sections = {
          {
            section = "terminal",
            cmd = "pokemon-colorscripts -n pikachu --no-title; sleep .1",
            indent = 20,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
