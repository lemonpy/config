--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- Toggle nvim-tree
map("n", "<leader>n", "<cmd>NvimTreeToggle<cr>", {})

-- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", {})
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", {})


-- lsp keybinding
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.definition, { buffer = args.buf })
    vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, { buffer = args.buf })
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, { buffer = args.buf })
  end,
})
