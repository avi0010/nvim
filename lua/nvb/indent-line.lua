vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#A6E3A1 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#B4BEFE gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#89DCEB gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#F9E2AF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#FAB387 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#F38BA8 gui=nocombine]]


require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

