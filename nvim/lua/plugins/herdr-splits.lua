return {
  "lmilojevicc/herdr-splits.nvim",
  cond = vim.env.HERDR_ENV == "1",
  event = "VeryLazy",
  config = function()
    require("herdr-splits").setup({
      default_amount = 0.03,
      neovim_amount = 3,
      at_edge = "wrap",
      unzoom_on_nav = true,
      nav_at_edge = "wrap",
    })
  end,
  keys = {
    {
      "<C-h>",
      function()
        require("herdr-splits").move_cursor_left()
      end,
      desc = "Navigate left",
    },
    {
      "<C-j>",
      function()
        require("herdr-splits").move_cursor_down()
      end,
      desc = "Navigate down",
    },
    {
      "<C-k>",
      function()
        require("herdr-splits").move_cursor_up()
      end,
      desc = "Navigate up",
    },
    {
      "<C-l>",
      function()
        require("herdr-splits").move_cursor_right()
      end,
      desc = "Navigate right",
    },
    {
      "<M-h>",
      function()
        require("herdr-splits").resize_left()
      end,
      desc = "Resize left",
    },
    {
      "<M-j>",
      function()
        require("herdr-splits").resize_down()
      end,
      desc = "Resize down",
    },
    {
      "<M-k>",
      function()
        require("herdr-splits").resize_up()
      end,
      desc = "Resize up",
    },
    {
      "<M-l>",
      function()
        require("herdr-splits").resize_right()
      end,
      desc = "Resize right",
    },
  },
}
