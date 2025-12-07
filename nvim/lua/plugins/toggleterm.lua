return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,

	config = function()
		local Terminal = require("toggleterm.terminal").Terminal

		-- ★ファイルのあるディレクトリでターミナルを開く
		local function open_term_in_file_dir()
			local dir = vim.fn.expand("%:p:h")
			if dir == "" or vim.fn.isdirectory(dir) ~= 1 then
				dir = vim.fn.getcwd() -- fallback（エラー回避）
			end

			local term = Terminal:new({
				dir = dir,
				direction = "horizontal",
				close_on_exit = false,
			})

			term:toggle()
		end

		require("toggleterm").setup({
			-- 独自マッピングで上書き（ToggleTerm のデフォルトは使わない）
			open_mapping = [[<c-t>]],
		})

		-- キーマッピング
		vim.keymap.set("n", "<C-t>", open_term_in_file_dir)
		vim.keymap.set("t", "<C-t>", [[<C-\><C-n>]] .. "<cmd>lua open_term_in_file_dir()<CR>")

		-- ESCでノーマルモードへ戻る
		vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { silent = true })

		-- Lazygit
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			hidden = true,
		})

		vim.keymap.set({ "n", "t" }, "<C-\\>", function()
			lazygit:toggle()
		end)
	end,
}
