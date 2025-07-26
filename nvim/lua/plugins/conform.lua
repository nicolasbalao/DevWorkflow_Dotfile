return {
  "stevearc/conform.nvim",
  otp = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        zig = { "zigfmt" },
      },
    })
  end,
}
