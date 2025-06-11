return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  --Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations
  lazy = false,
  skip_confirm_for_simple_edits = true,
  -- prompt_save_on_select_new_entry = false,
  view_options = {
    -- show_hidden = true,
  },
  keymaps = {
    ["<C-h>"] = { "actions.parent", mode = "n" },
    -- ["g?"] = { "actions.show_help", mode = "n" },
    -- ["<CR>"] = "actions.select",
    -- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    -- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
    -- ["<C-t>"] = { "actions.select", opts = { tab = true } },
    -- ["<C-p>"] = "actions.preview",
    -- ["<C-c>"] = { "actions.close", mode = "n" },
    -- ["<C-l>"] = "actions.refresh",
    -- ["-"] = { "actions.parent", mode = "n" },
    -- ["_"] = { "actions.open_cwd", mode = "n" },
    -- ["`"] = { "actions.cd", mode = "n" },
    -- ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    -- ["gs"] = { "actions.change_sort", mode = "n" },
    -- ["gx"] = "actions.open_external",
    -- ["g."] = { "actions.toggle_hidden", mode = "n" },
    -- ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },
}
