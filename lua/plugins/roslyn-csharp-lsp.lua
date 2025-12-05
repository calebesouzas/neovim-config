if os.getenv "TERMUX_VERSION" ~= nil then
  return {}
else
  return {
    "seblyng/roslyn.nvim",
    opts = {}
  }
end
