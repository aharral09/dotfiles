return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[ ____ ____ ____ ____ ____ ____ ]],
      [[||N |||E |||O |||V |||I |||M ||]],
      [[||__|||__|||__|||__|||__|||__||]],
      [[|/__\|/__\|/__\|/__\|/__\|/__\|]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("Ctrl-n", "📄 New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("Space-e", "🗂 File Explorer", ":NvimTreeToggle<CR>"),
      dashboard.button("Space-ff", "🔎 Find Files", ":Telescope find_files<CR>"),
      dashboard.button("Space-fs", "🔎 Find Text", ":Telescope live_grep<CR>"),
      dashboard.button("q", "❌ Quit NVIM", ":qa<CR>"),
    }
    alpha.setup(dashboard.opts)
  end,
}
