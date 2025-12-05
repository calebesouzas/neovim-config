utils = {
  ---@Function map
  ---Alias for 'vim.keymap.set(<mode>, <key>, <action> {desc = <desc>})'
  ---It can also handle keymap sets for multiple modes at once
  map = function(mode, key, action, desc)
    if type(mode) == table then
      for _mode in mode do
	vim.keymap.set(_mode, key, action, {desc = desc})
      end
    else
      vim.keymap.set(mode, key, action, {desc = desc})
    end
  end
}

return utils
