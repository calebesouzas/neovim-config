return {
  map = function(mode, key, action, desc)
    vim.keymap.set(mode, key, action, {desc = desc})
  end,
}
