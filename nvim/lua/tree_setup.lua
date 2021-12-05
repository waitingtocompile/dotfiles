
require'nvim-tree'.setup {
    open_on_setup = true,
    auto_close = true,--this causes the window to close if we exit the last non-tree buffer. If that irritates you, remove this line
    open_on_tab = true,
    --this makes compiler errors and the like show up on files.
    --it only works if you have a lsp stuff set up for that language
    diagnostics = {enable = true},
    filters = {custom = {".git", "node_modules", "cache"}},--hide some files that I normally don't want to see
    view = {auto_resize = true}
}
