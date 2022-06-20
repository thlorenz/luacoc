local M = {}

M.init = function ()
  vim.cmd [[
    noremap <silent> <leader>t=  :Tabularize /=<CR>
    noremap <silent> <leader>t,  :Tabularize /,<CR>
    noremap <silent> <leader>t;  :Tabularize /;<CR>
    noremap <silent> <leader>t:  :Tabularize /:<CR>
    noremap <silent> <leader>t(  :Tabularize /(<CR>
    noremap <silent> <leader>t\  :Tabularize /\<CR>
  ]]
end

return M
