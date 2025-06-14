return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    columns = {
      "icon",
      -- "size",
    },
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<Esc>"] = { "actions.close", mode = "n" },
      -- ["q"] = { "actions.close", mode = "n" }, -- intuitive, but maybe I would want to do a macro
      ["<C-h>"] = { "actions.parent", mode = "n" },
      ["<C-l>"] = { "actions.select", mode = "n" },
    },
  },
}
