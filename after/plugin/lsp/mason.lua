local ok, mason = pcall(require, 'mason')
if not mason then
	return
end

mason.setup({
	ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
