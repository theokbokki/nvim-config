vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_preview = 1


vim.cmd([[
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

function! NetrwMapping()
	nmap <buffer> . gh
	nmap <buffer> <leader>e <C-w>z<CR><C-6>:bd<CR>
endfunction

augroup netrw_mapping
	autocmd!
	autocmd FileType netrw call NetrwMapping()
augroup END
]])
