local ok, minifiles = pcall(require, 'mini.files')
if not ok then
	return
end

minifiles.setup {
	mappings = {
		close       = 'q',
		go_in       = 'L',
		go_in_plus  = 'l',
		go_out      = 'H',
		go_out_plus = 'h',
		reset       = '<BS>',
		show_help   = 'g?',
		synchronize = '=',
		trim_left   = '<',
		trim_right  = '>',
	},
	windows = {
		-- Maximum number of windows to show side by side
		max_number = 3,

		-- Whether to show preview of file/directory under cursor
		preview = true,

		-- Width of preview window
		width_preview = 50,
	},
}
