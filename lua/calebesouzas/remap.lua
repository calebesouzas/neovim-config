local map = require "calebesouzas.utils".map

-- // Persistance
-- load the session for the current directory
map("n", "<leader>qs",
  function() require("persistence").load() end,
  "Load session for current dir.")

-- select a session to load
map("n", "<leader>qS",
  function() require("persistence").select() end,
  "Select session to load")

-- load the last session
map("n", "<leader>ql",
  function() require("persistence").load({ last = true }) end,
  "Load the last session")

-- stop Persistence => session won't be saved on exit
map("n", "<leader>qd",
  function() require ("persistence").stop() end,
  "Cancel session saving")

-- // Which Key
map("n", "<leader>?",
  function() require "which-key".show { global = true } end,
  "Keymaps - Which Key")

-- // Undo Tree
map("n", "<leader>u", vim.cmd.UndotreeToggle,
  "Toggle Undo Tree")

-- // Vim Fugitive
map("n", "<leader>gs", vim.cmd.Git,
  "Open Fugitive screen")

-- Splitted buffers
map("n", "<leader>sh", "<cmd>horizontal split<CR>",
  "Split file horizontally")

map("n", "<leader>sv", "<cmd>vertical split<CR>",
  "Split file vertically")

map("n", "<leader><Up>", "<C-w><Up>",
  "Splitted window Up")

map("n", "<leader><Down>", "<C-w><Down>",
  "Splitted window Down")

map("n", "<leader><Left>", "<C-w><Left>",
  "Splitted window Left")

map("n", "<leader><Right>", "<C-w><Right>",
  "Splitted window Right")
