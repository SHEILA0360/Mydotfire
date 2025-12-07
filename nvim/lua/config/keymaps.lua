-- リーダーキーをスペースキーに設定
vim.g.mapleader = " "
-- ペースト時にカーソルを末尾へ移動
vim.keymap.set("n", "p", "p`]", { desc = "Paste and move to the end" })
vim.keymap.set("n", "P", "P`]", { desc = "Paste and move to the end" })
-- 「ｄ］でヤンク時に値を捨てる
vim.keymap.set({ "n", "x" }, "d", '"_d', { noremap = true, silent = true })
-- xキーで削除してもヤンクしない設定
vim.keymap.set({ "n", "x" }, "x", '"_x', { noremap = true, silent = true })
-- sキーで削除してもヤンクしない設定
vim.keymap.set({ "n", "x" }, "s", '"_s', { noremap = true, silent = true })
-- <Leader>+hで行の先端へ、<Leader>+lで行の末尾へ
vim.keymap.set("n", "<Leader>h", "^", { desc = "Move to the beginning of the line" })
vim.keymap.set("n", "<Leader>l", "$", { desc = "Move to the end of the line" })
-- jjでNomalモードへ
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "<C-k>", "<Up>")
--Open harpoon-list
vim.keymap.set("n", "<leader>Hl", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Open bookmark list", silent = true })
-- Open harpoon-add
vim.keymap.set("n", "<leader>Ha", function()
	require("harpoon.mark").add_file()
end, { desc = "add bookmark" })
-- change Zen-mode
vim.keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle()
end, { desc = "Zen-Modeに切り替え" })
