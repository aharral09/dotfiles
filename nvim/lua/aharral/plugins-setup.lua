-- auto install packer if not installed
local ensure_packer = function()
local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
	return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
	augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
	if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
  use('wbthomason/packer.nvim')
  use('Exafunction/codeium.vim')
  use('NeogitOrg/neogit')
  use('nvim-lua/plenary.nvim')
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"}) -- dependency for better sorting performance
  use({"nvim-telescope/telescope.nvim"}) -- fuzzy finder
  use('ellisonleao/gruvbox.nvim')	
  use('NvChad/nvterm')
  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons')
  use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
  use('iamcco/markdown-preview.nvim')
  use('williamboman/mason.nvim')
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use({
      'MeanderingProgrammer/markdown.nvim',
      as = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
      after = { 'nvim-treesitter' },
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
      config = function()
          require('render-markdown').setup({})
          require('render-markdown').enable()
      end,
  })
  use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
  }
  use {
      'goolord/alpha-nvim',
      config = function ()
      local alpha = require'alpha'
      local dashboard = require'alpha.themes.dashboard'
      dashboard.section.header.val = {
          [[   _  _                              _             ]], 
          [[  | \| |    ___     ___    __ __    (_)    _ __    ]], 
          [[  | .` |   / -_)   / _ \   \ V /    | |   | '  \   ]], 
          [[  |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_|  ]], 
          [[ _|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|  ]], 
          [[ "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'  ]]
      }
      dashboard.section.buttons.val = {
          dashboard.button( "Ctrl-n", "📄 New file" , ":ene <BAR> startinsert <CR>"),
          dashboard.button( "Space-e", "🗂 File Explorer" , ":NvimTreeToggle<CR>"),
          dashboard.button( "Space-ff", "🔎 Find Files", ":Telescope find_files<CR>"),
          dashboard.button( "Space-fs", "🔎 Find Text", ":Telescope live_grep<CR>"),
          dashboard.button( "q", "❌ Quit NVIM" , ":qa<CR>"),
      }
      dashboard.config.opts.noautocmd = true
      vim.cmd[[autocmd User AlphaReady echo 'ready']]
      alpha.setup(dashboard.config)                                                                                     
      end
  }
	if packer_bootstrap then
		require("packer").sync()
	end
end)
