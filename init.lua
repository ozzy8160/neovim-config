vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.relativenumber = true
require("config.lazy")
require("config.keymaps")
require("lualine").setup {
  options = { 
    theme = 'dracula' 
  }
}

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"bash", "css", "dockerfile", "hyprlang", "lua", "luadoc", "nix", "markdown", "vim", "vimdoc", "xml", "yaml"},
  sync_install = false,
  highlight = {enable = true},
  indent = {enable = true},
})

local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<C-;>", function() harpoon:list():select(5) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
 
-- In your configuration file (e.g., lua/config/whichkey.lua)
local whichkey = require("which-key")
whichkey:setup({
    -- Example: Set a shorter timeout for the popup
    delay = 300, -- milliseconds
    -- Other configuration options can be added here
})
--require("nightly").setup({
--  transparent = true,
--  styles = {
--    comments = { italic = true },
--functions = { italic = false },
--    variables = { italic = false },
--    keywords = { italic = false },
--  },
--  highlights = {},
--})


