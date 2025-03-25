return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      --vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      --vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
		end
	},
}
