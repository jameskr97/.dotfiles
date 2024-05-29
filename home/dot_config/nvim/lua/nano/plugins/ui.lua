return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000, lazy = false,
        dependencies = {
            {"scottmckendry/cyberdream.nvim", opt = {}},
            {"folke/tokyonight.nvim", opt = {}},
        },
        init = function()
            vim.cmd.colorscheme "kanagawa"
            local themes = {
                "kanagawa-wave",
                "kanagawa-dragon",
                "kanagawa-lotus",
                "cyberdream",
                "tokyonight",
            }

            -- Add letter key for each
            for index, value in ipairs(themes) do
                vim.keymap.set('n', '<leader>c'..index, '<cmd> colorscheme ' .. value .. '<CR>')
            end

            -- Add select menu for the same thing
            vim.keymap.set('n', '<leader>cc', function ()
                vim.ui.select(themes, {
                    prompt = "Select theme",
                    telescope = require("telescope.themes").get_cursor(),
                }, function(theme) vim.cmd('colorscheme '..theme) end)

            end, {desc = "Open Selection Drop-Down" })
        end
    },
    { 
        "stevearc/dressing.nvim",
        opt = {
            input = {
                start_in_insert = false
            }
        }
    }
}

