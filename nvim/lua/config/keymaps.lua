function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<Leader>l",  ":Neotree float<CR>")
map("n", "<Leader>?",  ":WhichKey<CR>")

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fg", ":Telescope live_grep<CR>")
map("n", "<Leader>b",  ":Telescope buffers<CR>")
map("n", "<Leader>cd", ":Telescope diagnostics<CR>")
map("n", "<Leader>:",  ":Telescope commands<CR>")
map("n", "<Leader>fp", ":Telescope projects<CR>")

-- Gitlinker
map("n", "<Leader>gy", ":GitLink<CR>")
map("n", "<Leader>gY", ":GitLink!<CR>")
map("v", "<Leader>gy", ":GitLink<CR>")
map("v", "<Leader>gY", ":GitLink!<CR>")

-- Gitsigns
map("n", "<Leader>gb", ":Gitsigns blame_line<CR>")
map("n", "<Leader>gB", ":Gitsigns blame<CR>")
map("n", "<Leader>ghu", ":Gitsigns undo_stage_hunk<CR>")
map("n", "<Leader>ghr", ":Gitsigns reset_hunk<CR>")
map("n", "<Leader>ghn", ":Gitsigns next_hunk<CR>")
map("n", "<Leader>ghp", ":Gitsigns prev_hunk<CR>")


map("n", "<C-w>m", ":WindowsMaximize<CR>")
