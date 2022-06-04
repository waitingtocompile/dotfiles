
require'nvim-tree'.setup {
    open_on_setup = true,
    open_on_tab = true,
    --this makes compiler errors and the like show up on files.
    --it only works if you have a lsp stuff set up for that language
    diagnostics = {enable = true},
    filters = {custom = {".git", "node_modules", "cache"}},--hide some files that I normally don't want to see
    view = {auto_resize = true},
    renderer = {indent_markers = {enable = true}}
}

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
