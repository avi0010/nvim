require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
vim.cmd[[highlight IndentBlanklineContextChar guifg=#CBA6F7 gui=nocombine]]
