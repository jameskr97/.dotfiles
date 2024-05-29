return {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "bash",
            "yaml",
            "toml",
            "lua",
            "markdown",
            "cpp",
            "vimdoc"
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    config = function(_, opts)
        require('nvim-treesitter.install').prefer_git = true
        require("nvim-treesitter.configs").setup(opts)
    end
}