--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = " "
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins


-- Run :PackerCompile on plug.lua changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plug.lua source <afile> | PackerCompile
  augroup end
]])

-- PLUGINS: Add this section
require('nvim-tree').setup{
    respect_buf_cwd = true,
    hijack_netrw = true,
    hijack_directories = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        -- ignore help files
        ignore_list = {"txt"},
    },
    renderer = {
        highlight_opened_files = "icon",
    }
}

require('lualine').setup{
    options = {
        theme = "dracula-nvim",
    },
    -- Improve lualine in this windows curr not working :(
    extensions = {
        nerdtree,
        fzf,
        fugitive,
    },
}

require('tabline').setup{
-- Defaults configuration options
      enable = true,
      options = {
      -- If lualine is installed tabline will use separators configured in lualine by default.
      -- These options can be used to override those settings.
        --section_separators = {'', ''},
        --component_separators = {'', ''},
        --max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
        section_separators = {'', ''},
        show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
        show_devicons = true, -- this shows devicons in buffer section
        show_bufnr = false, -- this appends [bufnr] to buffer section,
        show_filename_only = false, -- shows base filename only instead of relative path in filename
        modified_icon = "+ ", -- change the default modified icon
        modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
        show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
      }
}

require('telescope').setup{
    pickers = {
        find_files = {
            theme = "dropdown",
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

require('lspconfig').clangd.setup{}

-- [[ Trickaso ]]
-- To reload some config use ´:luafile %´

-- [[ Install packer ]]
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.config/nvim/site/pack/packer/start/packer.nvim
