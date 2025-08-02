function ColorMyPencils(color)
  color = color or "rose-pine-moon"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#232136" })
end

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        --disable_background = true,
        variant = "moon",
        dark_variant = "moon",
        styles = {
          italic = false,
          transparency = true,
        },
      })

      ColorMyPencils()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catpuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "auto",
        transparent_background = true,
        background = {
          dark = "mocha",
        },
      })
    end,
  },
}
