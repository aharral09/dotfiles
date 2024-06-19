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

  -- statusline
  use('nvim-lualine/lualine.nvim')

  -- nvterm
  use('NvChad/nvterm')
  
  -- colorschemes - update core/colorschemes
  use('ellisonleao/gruvbox.nvim')

  -- file explorer
  use('nvim-tree/nvim-tree.lua')

  -- VSCode Icons
  use('kyazdani42/nvim-web-devicons')

  -- plenary (required for telescope)
  use('nvim-lua/plenary.nvim')

  -- fuzzy finding w/ telescope
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"}) -- dependency for better sorting performance
  use({"nvim-telescope/telescope.nvim", branch = "0.1.x"}) -- fuzzy finder

  -- treesitter
  use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

  -- markdown preview
  use ('iamcco/markdown-preview.nvim')

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
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
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
