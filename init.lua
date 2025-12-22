-- // Leader Mappings // --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- // Options // --
-- Line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Scrolling
vim.o.scrolloff = 16

-- Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- // Lazy Plugin Manager Config // --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {}, },
    { "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate",
      config = function()
        require"nvim-treesitter.install".compilers = {"gcc", "clang"}
        require"nvim-treesitter".setup{
          install_dir = vim.fn.stdpath("data") .. "/site"
        }
      end
    },
    { "nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"},
      keys = {
        {"<leader>ff", ":Telescope find_files<CR>",
          desc = "Telescope find files"},
        {"<leader>lg", ":Telescope live_grep<CR>",
          desc = "Telescope live grep"},
        {"<leader>fb", ":Telescope buffers<CR>",
          desc = "Telescope buffers"},
        {"<leader>fh", ":Telescope help_tags<CR>",
          desc = "Telescope help tags"},
        {"<leader>fg", ":Telescope git_files<CR>",
          desc = "Telescope git files"},
        {"<leader>fo", ":Telescope oldfiles<CR>",
          desc = "Telescope recent files"},
        {"<leader>ft", ":Telescope treesitter<CR>",
          desc = "Telescope + Tree Sitter"}
      }
    },
    { "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = {"nvim-lua/plenary.nvim"},
      config = function()
        local harpoon = require "harpoon"
        harpoon:setup()
      end
    },
  },
  -- install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})


