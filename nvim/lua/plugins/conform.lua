return {
	"stevearc/conform.nvim",
	event = { "VeryLazy" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				javascript = { "prettierd", "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
		vim.api.nvim_create_user_command("Format", function(args)
			require("conform").format({ async = args.bang })
		end, { bang = true })
	end,
}
