-- Editor Configuraiton
---- Leader Shortcut `:help mapleader`
vim.g.swapfile = false      -- Disable swap file
vim.g.mapleader = ' '       -- Leader keymap for personal shortcuts
vim.g.maplocalleader = ' '  -- Local leader for plugin specific shortcuts (?)
vim.g.have_nerd_font = true

---- Default Indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

---- Line related
vim.opt.number = false          -- Show line numbers
vim.opt.relativenumber = true   -- Show relative line numbers
vim.opt.scrolloff = 10          -- Minimum number of lines to show when scrolling up or down
vim.opt.guicursor = ""          -- Keep block when in insert mode

---- Misc Options
vim.opt.updatetime = 50         -- ???
vim.opt.wrap = false            -- Disable line wrapping
vim.opt.mouse = 'a'             -- Enable mouse mode
vim.opt.showmode = true         -- Show what mode we're in (until status line)
vim.opt.cursorline = true       -- Highlight the cursor line

------ Whitespace
vim.opt.list = true                                             -- Should whitespace characters be visible?
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }     -- How should whitespace variables be visible?
------ Search Related
vim.opt.hlsearch = true                                 -- Highlight terms when searching
vim.opt.incsearch = true                                -- Incrementally highlight searches as typing
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')     -- Press escape to remove highlights
vim.opt.inccommand = 'split'                            -- When doing a %s replace, show the replacements in a split box above command line
-- Key Remapping
---- Selection Commands
vim.keymap.set('n', '<C-a>', 'gg<S-a>G')
---- Window moving commands
vim.keymap.set('n', 'ss', ':split<Return>')     -- Horizontal Split
vim.keymap.set('n', 'sv', ':vsplit<Return>')    -- Veritcal Split
vim.keymap.set('n', 'sh', '<C-w>h')             -- Move to window on left
vim.keymap.set('n', 'sj', '<C-w>j')             -- Move to window on down
vim.keymap.set('n', 'sk', '<C-w>k')             -- Move to window on up
vim.keymap.set('n', 'sl', '<C-w>l')             -- Move to window on right
vim.keymap.set('n', '<C-w><left>', '<C-w><')    -- Resize window to left
vim.keymap.set('n', '<C-w><right>','<C-w>>')    -- Resize window to left
vim.keymap.set('n', '<C-w><up>','<C-w>+')       -- Resize window to left
vim.keymap.set('n', '<C-w><down>','<C-w>-')     -- Resize window to left
---- LSP Diagnostic Motions
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<lader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
---- Keep cursor centered
vim.keymap.set('n', 'k', 'kzz')
vim.keymap.set('n', 'j', 'jzz')
vim.keymap.set('n', 'G', 'Gzz')
---- Motion Motifications
vim.keymap.set('n', '<C-k>', "<C-u>zz")     -- Center after half page jump up
vim.keymap.set('n', '<C-j>', "<C-d>zz")     -- Center after half page jump down
---- Number Incrementing
vim.keymap.set("n", "=", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement number" }) -- decrement

---- Misc Keybinds
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)   -- Show file browser

---- Disable arrowkeys in normal + insert mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move"<CR>')

