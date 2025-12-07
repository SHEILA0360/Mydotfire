return {
  "nvim-tree/nvim-web-devicons", -- ① プラグインのGitHubリポジトリ名
  version = "*", -- ② バージョン指定（*は最新を意味）
  lazy = false, -- ③ lazyロードを使わない（起動時に読み込む）
  config = function()
    -- ファイルアイコンの設定
    require("nvim-web-devicons").setup({
      override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh",
        },
      },
      color_icons = true,
      default = true,
    })
  end,
}
