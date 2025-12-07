return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true

		-- colorscheme の前にグローバル設定を行う
		vim.g.everforest_background = "soft" -- 'hard' / 'medium' / 'soft'
		vim.g.everforest_transparent_background = 0
		vim.g.everforest_enable_italic = true

		-- プラグインが setup を提供していれば呼ぶ（安全対策）
		local ok, everforest = pcall(require, "everforest")
		if ok and type(everforest.setup) == "function" then
			everforest.setup({ transparent_background_level = 0 })
		end

		-- colorscheme の適用（protected call）
		pcall(vim.cmd, "colorscheme everforest")
	end,
}
