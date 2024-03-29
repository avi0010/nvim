local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>R", "<cmd>:%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i<cr>", opts)
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<ESC>", ":nohl<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "<leader>/", ":Grepper -highlight -buffer <cr>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope --
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>F", "<cmd>Telescope live_grep<cr>", opts)
  -- LSP --
keymap("n", "<leader>lr", "<cmd>lua require'telescope.builtin'.lsp_references{}<cr>", opts)
keymap("n", "<leader>ld", "<cmd>lua require'telescope.builtin'.lsp_definitions{}<cr>", opts)
keymap("n", "<leader>le", "<cmd>lua require'telescope.builtin'.diagnostics{}<cr>", opts)
keymap("n", "<leader>li", "<cmd>lua require'telescope.builtin'.lsp_implementations{}<cr>", opts)
  -- GIT --
keymap("n", "<leader>gc", "<cmd>lua require'telescope.builtin'.git_commits{}<cr>", opts)
keymap("n", "<leader>gb", "<cmd>lua require'telescope.builtin'.git_branches{}<cr>", opts)
keymap("n", "<leader>gs", "<cmd>lua require'telescope.builtin'.git_status{}<cr>", opts)

-- Nvim-Tree --
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<cr>", opts)

-- Tmux --
keymap("n", "<leader>vp", ":VimuxPromptCommand<CR>", opts)
keymap("n", "<leader>vl", ":VimuxRunLastCommand<CR>", opts)
keymap("n", "<leader>vi", ":VimuxInspectRunner<CR>", opts)
