return {
	"ishan9299/nvim-solarized-lua",
	lazy = false,
	priority = 1000,
	config = function()
		-- enable true color
		vim.o.termguicolors = true
		-- transparent terminal background for this scheme (if desired)
		vim.g.solarized_termtrans = 1

		-- disable semantic tokens highlight (plugin does not support them yet)
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.server_capabilities then
					client.server_capabilities.semanticTokensProvider = nil
				end
			end,
		})

		-- fixes/adjustments after colorscheme is set
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "solarized",
			callback = function()
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
				vim.api.nvim_set_hl(0, "LineNr", { fg = "#586e75", bg = "none" })
				vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b58900", bg = "none" })
				vim.api.nvim_set_hl(0, "CursorLine", { fg = "none", bg = "#002b36" })
				vim.api.nvim_set_hl(0, "Visual", { fg = "#002b36", bg = "#586e75" })
				vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#dc322f", bg = "#360909" })
				vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#b58900", bg = "#1c1500" })
				vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#268bd2", bg = "#0e3550" })
				vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#2aa198", bg = "#0a2725" })
				vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#268bd2", bg = "none" })
				vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#2aa198", bg = "none" })
				vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#586e75" })
				vim.api.nvim_set_hl(0, "LazyButton", { link = "Visual" })
				vim.api.nvim_set_hl(0, "LazyButtonActive", { link = "IncSearch" })
				vim.api.nvim_set_hl(0, "AlphaButtons", { link = "Conceal" })
				vim.api.nvim_set_hl(0, "AlphaHeader", { link = "Debug" })
				vim.api.nvim_set_hl(0, "AlphaShortcut", { italic = true, fg = "#859900" })
				vim.api.nvim_set_hl(0, "AlphaFooter", { link = "String" })
				vim.api.nvim_set_hl(0, "CurSearch", { link = "IncSearch" })
				vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#2aa198" })
				vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#268bd2" })
				vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#b58900" })
				vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#dc322f" })
				vim.api.nvim_set_hl(0, "@parameter", { link = "Variable" })
				vim.api.nvim_set_hl(0, "@variable.parameter", { link = "Variable" })
				vim.api.nvim_set_hl(0, "@lsp.type.parameter", { link = "Variable" })
				vim.cmd("highlight GitSignsAdd guibg=none")
				vim.cmd("highlight GitSignsChange guibg=none")
				vim.cmd("highlight GitSignsDelete guibg=none")
			end,
			group = vim.api.nvim_create_augroup("FixSolarized", { clear = true }),
			desc = "Fix some highlight for solarized colorscheme",
		})

		-- finally apply colorscheme
		vim.cmd.colorscheme("solarized")
	end,
}
