local laravel_ok, laravel = pcall(require, "laravel")
if not laravel_ok then
	return
end

laravel.setup {
	route_info = {
		enable = true,
		position = "top",
	},
}

local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	return
end

telescope.load_extension "laravel"
