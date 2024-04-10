return {
	'numToStr/Comment.nvim',
	lazy = false,
    config = function()
        require('Comment').setup()

        local ft = require('Comment.ft')
        ft.set('blade', {'{{--%s--}}', '{{--%s--}}'})
    end
}
