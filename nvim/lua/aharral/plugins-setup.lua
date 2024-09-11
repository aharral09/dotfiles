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

  -- packer can manage itself
  use('wbthomason/packer.nvim')

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  }

  -- statusline
  use('nvim-lualine/lualine.nvim')

  -- Tabs
  use('lewis6991/gitsigns.nvim')
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup()
    end,
  }

  -- nvterm
  use('NvChad/nvterm')

  -- colorschemes - update core/colorschemes
  use('ellisonleao/gruvbox.nvim')
  use{"catppuccin/nvim", as = "catppuccin" }

  -- file explorer
  use('nvim-tree/nvim-tree.lua')

  -- VSCode Icons
  use('kyazdani42/nvim-web-devicons')

  -- plenary (required for telescope)
  use('nvim-lua/plenary.nvim')

  -- fuzzy finding w/ telescope
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"}) -- dependency for better sorting performance
  use({"nvim-telescope/telescope.nvim"}) -- fuzzy finder

  -- treesitter
  use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

  -- markdown
  use('iamcco/markdown-preview.nvim')
  use('tpope/vim-markdown')
  use({
    'MeanderingProgrammer/markdown.nvim',
    as = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    after = { 'nvim-treesitter' },
    requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
    -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function()
        require('render-markdown').setup({})
        require('render-markdown').enable()
    end,
  })

  -- link following
  use('alexpearce/nvim-follow-markdown-links', {'do', ':UpdateRemotePlugins'})

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},
	  }
  }
  -- autocomplete
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

  -- start page
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
