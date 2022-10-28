-- [[ plug.lua ]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
-- [[ Plugins Go Here ]]

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {                                                -- filesystem navigation
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
    }
    -- [[ Theme ]]

    use { 'mhinz/vim-startify' }                         -- start screen
    use {
        'nvim-lualine/lualine.nvim',                     -- statusline
        requires = {'kyazdani42/nvim-web-devicons',
                    opt = true}
    }

    use { 'Mofiqul/dracula.nvim' }                       -- colorscheme

    use {
        'kdheepak/tabline.nvim',                         -- tabline
        requires = { 
            { 'nvim-lualine/lualine.nvim', opt=true },
            {'kyazdani42/nvim-web-devicons', opt = true}
        }
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    use {
        'neovim/nvim-lspconfig'
    }

    config = {
        package_root = vim.fn.stdpath('config') .. '/site/pack'
    } 
-- end of plugins
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

