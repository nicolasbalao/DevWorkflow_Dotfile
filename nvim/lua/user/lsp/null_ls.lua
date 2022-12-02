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

--[[
-- Testing setup automatically with the mason api

local mason_registry_ok, mason_registry = pcall(require, "mason-registry")

if not mason_registry_ok then
	return
end

local show = function(table)
	print(vim.inspect(table))
end


local my_package_installed = mason_registry.get_installed_packages()
local formatter = {}
local linter = {}
local dap = {}

for _, package in pairs(my_package_installed) do
	--print(package.name)
	--show(package.spec.categories[1])
	local categories = package.spec.categories[1]

	if categories == "Formatter" then
		table.insert(formatter, package.name)
	elseif categories == "Linter" then
		table.insert(linter, package.name)
    elseif categories == "DAP" then
        table.insert(dap, package.name)
	end
end

show(formatting.stylua)
]]
