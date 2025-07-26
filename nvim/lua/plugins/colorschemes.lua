function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                extend_background_behind_borders = false,
                styles = {
                    italic  = false,
                    transparency = true,
                },
            })

            ColorMyPencils();
        end
    },
    {
        "catppuccin/nvim",
        name = "catpuccin",
        config = function() 
            require('catppuccin').setup({
                flavour = "auto",
                transparent_background = true,
                background = {
                    dark = "mocha",
                },
            })
--            ColorMyPencils('catppuccin')
        end
    }
}
