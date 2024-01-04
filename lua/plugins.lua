require("lazy").setup({
    {
        "max397574/better-escape.nvim",
        config = function() require("better_escape").setup() end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function() require("lsp") end,
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "nvim-treesitter/nvim-treesitter",
        }
    },
    {
        "echasnovski/mini.move",
        config = function()
            require("mini")
        end,
    },
    {
        "github/copilot.vim",
        config = function()
            require("copilot")
        end,
    },
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crate")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
})
