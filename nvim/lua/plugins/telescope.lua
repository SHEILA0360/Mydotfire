return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "ThePrimeagen/harpoon" }, -- 依存も明記
  version = "*",
  lazy = false,
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-a>"] = function(prompt_bufnr)
              local entry = action_state.get_selected_entry()
              local filepath = entry.path or entry.value
              require("harpoon.mark").add_file(filepath)
              actions.close(prompt_bufnr)
            end,
          },
          n = {
            ["<C-a>"] = function(prompt_bufnr)
              local entry = action_state.get_selected_entry()
              local filepath = entry.path or entry.value
              require("harpoon.mark").add_file(filepath)
              actions.close(prompt_bufnr)
            end,
          },
        },
      },
    })
    require("telescope").load_extension("harpoon")
  end,
}