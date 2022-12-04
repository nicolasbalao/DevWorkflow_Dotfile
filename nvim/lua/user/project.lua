local project_ok, project = pcall(require, "project_nvim")

if not project_ok then
	print("Missing project")
	return
end

project.setup()

local telescope_ok, telescope = pcall(require, "telescope")

if not telescope_ok then
	print("Missing telescope")
	return
end

telescope.load_extension("projects")
