local formatters = {
  black = {
    command = "black",
    args = { "--line-length=150", "-" }, -- "-" tells black to read from stdin
  },
  stylua = {
    command = "stylua",
  },
}

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters = formatters,
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        sh = { "shfmt" },
        markdown = { "prettier", "mdsf" },
        go = { "gofmt" },
        json = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
      },
    })
  end,
}
