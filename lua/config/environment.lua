vim.env.CC = "gcc"
vim.env.CXX = "g++"

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>d", function()
  local disabled = not vim.diagnostic.is_enabled()
  if disabled then
    vim.notify("Enabling diagnostics...", vim.log.levels.WARN)
  else
    vim.notify("Disabling diagnostics...", vim.log.levels.WARN)
  end

  vim.diagnostic.enable(disabled)
end)
