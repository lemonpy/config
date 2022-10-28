--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- Toggle nvim-tree

map("n", "<leader>n", "<cmd>NvimTreeToggle<cr>", {})
