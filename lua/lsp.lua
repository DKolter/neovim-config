-- Lsp attach handler
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = true }
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>")
        bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
        bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
        bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
        bufmap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
        bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
        bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
        bufmap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>")
        bufmap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
        bufmap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>")
        bufmap("n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<cr>")
    end
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded" }
)

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "pyright",
        "clangd",
        "cssls",
        "html",
        "jsonls",
        "tsserver",
        "slint_lsp",
        "wgsl_analyzer",
    }
})

-- Treesitter setup
require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "rust",
        "python",
        "html",
        "javascript",
        "css",
        "csv",
        "json",
        "toml",
        "xml",
        "slint",
        "wgsl",
    }
})

-- Configure the lsps
local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.lua_ls.setup({ capabilities = lsp_capabilities })
lspconfig.rust_analyzer.setup({ capabilities = lsp_capabilities })
lspconfig.pyright.setup({ capabilities = lsp_capabilities })
lspconfig.clangd.setup({ capabilities = lsp_capabilities })
lspconfig.cssls.setup({ capabilities = lsp_capabilities })
lspconfig.html.setup({ capabilities = lsp_capabilities })
lspconfig.jsonls.setup({ capabilities = lsp_capabilities })
lspconfig.tsserver.setup({ capabilities = lsp_capabilities })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.wgsl",
    command = "setfiletype wgsl"
})
lspconfig.wgsl_analyzer.setup({ capabilities = lsp_capabilities })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.slint",
    command = "setfiletype slint"
})
lspconfig.slint_lsp.setup({ capabilities = lsp_capabilities })

-- Configure auto completion
local cmp = require("cmp")
local luasnip = require("luasnip")

local select_opts = {
    behavior = cmp.SelectBehavior.Select
}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = "path" },
        { name = "crates" },
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "buffer",   keyword_length = 3 },
        { name = "luasnip",  keyword_length = 2 },
    },
    mapping = {
        ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
        ["<Down>"] = cmp.mapping.select_next_item(select_opts),

        ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
        ["<C-n>"] = cmp.mapping.select_next_item(select_opts),

        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        ["<C-f>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<C-b>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            local col = vim.fn.col(".") - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
                fallback()
            else
                cmp.complete()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
})
