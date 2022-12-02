local treesitter_status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not treesitter_status_ok then
	print("Missing treesitter")
	return
end

configs.setup({

	ensure_installed = { "c", "lua", "bash" },

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	sync_install = false,

	autopair = {
		eneable = true,
	},
	highlight = {
		-- false will disable the whole extension
		enable = true,
	},
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
