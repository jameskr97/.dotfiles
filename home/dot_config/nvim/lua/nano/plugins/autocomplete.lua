return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
        -- Sources
        "hrsh7th/cmp-path",                     -- Source for file-system paths
        "hrsh7th/cmp-buffer",                   -- Source for text in-buffer
        "hrsh7th/cmp-nvim-lsp",                 -- Source for neovim LSP client
        "saadparwaiz1/cmp_luasnip",             -- Source for LuaSnip snippet engine
        {
            "L3MON4D3/LuaSnip",                 -- Snippet engine
            dependencies = {
                "rafamadriz/friendly-snippets"  -- Snippet Library
            },
        },
        -- "L3MON4D3/LuaSnip",             -- Snippet Engine
        -- "rafamadriz/friendly-snippets", -- General Language Snippets
    },
    config = function()
        local cmp = require('cmp')
        local lsnip = require('luasnip')
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            snippet = { expand = function(args) lsnip.lsp_expand(args.body) end },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            -- documentation = {
            --     border = border("CmpDocBorder"),
            --     winhighlight = "Normal:CmpDoc",
            -- },
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),

                -- Super-Tab (tab/s-tab to next/prev completion or snippet fill-in)
                -- TODO: Maybe better mapping? https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
                ["<Tab>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif lsnip.expand_or_jumpable() then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                    else
                        fallback()
                    end
                end, {'i', 's'}),
                ["<S-Tab>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif lsnip.jumpable(-1) then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                    else
                        fallback()
                    end
                end, {"i", "s"}),
            }),
            formatting = {
                format = function(entry, vim_item)
                    local MAX_CMP_STR_WIDTH = 30
                    vim_item.abbr = string.sub(vim_item.abbr, 1, MAX_CMP_STR_WIDTH)
                    return vim_item
                end
            }
       })
    end

}
