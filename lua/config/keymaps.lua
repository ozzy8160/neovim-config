--Telescope keymaps--
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Find todos" })

--Undotree keymap--
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

--custom keybinds--
vim.keymap.set('n', '<leader>W', ':wq<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>Q', ':q!<CR>')
vim.keymap.set('n', '<leader>cd', ':Ex<CR>')
vim.keymap.set("n", "<leader>x", function()
  local file = vim.fn.expand("%:p") -- Get the full path of the current file
  vim.cmd("!chmod +x " .. vim.fn.shellescape(file)) -- Execute chmod command
  print("Made " .. file .. " executable.") -- Optional: print a confirmation message
end, { desc = "Make current file executable" })
