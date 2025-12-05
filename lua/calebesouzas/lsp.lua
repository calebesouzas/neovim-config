vim.g.c_syntax_for_h = 1

local servers = {
  "lua_ls",
  "clangd",
  "html-lsp",
  "css-lsp",
  "rust-analyzer",
}
if os.getenv"TERMUX_VERSION" == nil then
  table.insert(servers, "roslyn")
end

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
