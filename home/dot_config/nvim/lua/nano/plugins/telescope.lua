return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-telescope/telescope-file-browser.nvim'},
    },
    init = function()
        local tsc = require('telescope')
        local tscb = require('telescope.builtin')
        local map = function (keys, func, desc)
            vim.keymap.set('n', keys, func, { desc = 'TSC: ' .. desc } )
        end

        -- Anonymous functions for telescope operations
        local find = function() tscb.find_files({ no_ignore = true, hidden = true }) end
        local find_plug = function() tscb.find_files({ cwd = require("lazy.core.config").options.root}) end
        local grep_str = function() tscb.grep_string({ search = vim.fn.input("Enter grep string:") }) end
        local open_file_browser = function()
            local buff_dir = function() return vim.fn.expand("%:p:h") end
            tsc.extensions.file_browser.file_browser({
                path = "%:p:h",
                cwd = buff_dir(),
                respect_gitignore = false,
                hidden = true,
                grouped = true,
                previewer = false,
                initial_mode = "normal",
                layout_config = { height = 40 }
            })
        end

        -- Telescope shortcuts
        map(';k',           tscb.keymaps,        '[S]earch [K]eymaps')
        map('\\\\',         tscb.buffers,        'List open buffers')
        map(';e',           tscb.diagnostics,    'List diagnostics for buffer')
        map(';p',           tscb.planets,        'Use the telescope?')
        map(';f',           find,                'List files in current working directory, respecting .gitignore')
        map(';s',           tscb.treesitter,     'List function names + variables from treesitter')
        map(';t',           tscb.help_tags,      'Show help_tags')
        map(';;<Esc>',      tscb.resume,         'Resume the previous telescope picker')
        map(';gf',          tscb.git_files,      'Show [G]it [F]iles')
        map('<leader>pP',   find_plug,           'Search for plugin files')
        map('<leader>pf',   tscb.find_files,     'Search for files in project root')
        map('<leader>ps',   grep_str,            'Grep search for a string')
        map('<leader>sb',   open_file_browser,   '[S]how file [b]rowser')
    end
}
