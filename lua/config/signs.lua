local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for severity, icon in pairs(signs) do
  local name = "DiagnosticSign" .. severity
  vim.fn.sign_define(name, { text = icon, texthl = name, linehl = "", numhl = "" })
end

