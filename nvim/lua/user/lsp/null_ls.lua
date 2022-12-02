local null_ls_ok, null_ls = pcall(require, "null-ls")

if not null_ls_ok then
	print("Missing Null-ls")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostic

null_ls.setup({
	sources = {
		formatting.stylua,
	},
})

