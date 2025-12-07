return {
  "ThePrimeagen/harpoon", -- ① プラグインのGitHubリポジトリ名
  dependencies = { "nvim-lua/plenary.nvim" },
  version = "*", -- ② バージョン指定（*は最新を意味）
  lazy = false, -- ③ lazyロードを使わない（起動時に読み込む）
  config = function()
    require("harpoon").setup({})
  end,
}