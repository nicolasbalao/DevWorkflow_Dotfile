local lualine_ok, lualine = pcall(require, 'lualine')
if not lualine_ok then
    print("Missing lualine")
    return
end


lualine.setup()
