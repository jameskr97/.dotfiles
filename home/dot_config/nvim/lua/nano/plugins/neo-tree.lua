return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
        window = {
            mappings = {
                ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
                ["S"] = "noop",
                ["s"] = "noop",
            }
        }
    },
    init = function ()
        vim.keymap.set('n', '<leader>f', ':Neotree toggle<CR>')
    end
}
