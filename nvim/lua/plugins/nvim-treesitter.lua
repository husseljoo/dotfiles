return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "json", "javascript", "html", "go" },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>", --false
          node_incremental = "<Enter>", -- false
          scope_incremental = false,
          node_decremental = false, -- "<Backspace>"
        },
      },
    })
  end,
}
