return {
  "nvim-tree/nvim-tree.lua", -- ① プラグインのGitHubリポジトリ名
  version = "*", -- ② バージョン指定（*は最新を意味）
  lazy = false, -- ③ lazyロードを使わない（起動時に読み込む）
  dependencies = { -- ④ 依存プラグイン（nvim-web-deviconsも一緒に読み込む）
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { mode = "n", "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "NvimTreeToggle" },
    {
      mode = "n",
      "<leader>E",
      function()
        local path = vim.fn.input("NvimTreeOpen path: ")
        if path ~= "" then
          vim.cmd("NvimTreeOpen " .. path)
        end
      end,
      desc = "NvimTreeOpen: 指定パスを入力して開く",
    },
    { mode = "n", "<C-m>", "<cmd>NvimTreeFocus<CR>", desc = "NvimTreeにフォーカス" },
  },
  config = function() -- ⑤nard Fontが必要
    require("nvim-tree").setup({
      update_focused_file = {
        enable = true,
        update_cwd = true,
      }, --    nvim-treeをデフォルト設定で起動
    })
  end,
}
