return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    init = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = {
                exclude = {
                    "clangd",
                },
            },
            ensure_installed = {
                "marksman",     -- Markdown
                "lua_ls",       -- Lua
                "yamlls",       -- YAML

                -- Web Development
                "tsserver",
                "tailwindcss",
            }
        })
    end
}

