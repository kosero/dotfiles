local function set_highlights()
  local set_hl = vim.api.nvim_set_hl

  set_hl(0, "TodoDone",    { link = "DiagnosticOk", bold = true })
  set_hl(0, "TodoDoing",   { link = "DiagnosticWarn", bold = true })
  set_hl(0, "TodoPaused",  { link = "DiagnosticInfo", bold = true })
  set_hl(0, "TodoUnknown", { link = "DiagnosticHint", bold = true })
  set_hl(0, "TodoPending", { link = "Comment" })

  set_hl(0, "TodoParentheses", { link = "LineNr" })

  -- Başlıklar
  set_hl(0, "TodoHeader",  { link = "Title", bold = true })
  set_hl(0, "TodoSection", { link = "Statement", bold = true })
end

set_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_highlights,
})

local function apply_matches()
  for _, match in ipairs(vim.fn.getmatches()) do
    if match.group:sub(1, 4) == "Todo" then
      vim.fn.matchdelete(match.id)
    end
  end

  vim.fn.matchadd("TodoDone",    "^\\[x\\]")
  vim.fn.matchadd("TodoDoing",   "^\\[y\\]")
  vim.fn.matchadd("TodoPaused",  "^\\[d\\]")
  vim.fn.matchadd("TodoUnknown", "^\\[\\?\\]")
  vim.fn.matchadd("TodoPending", "^\\[ \\?\\]")

  vim.fn.matchadd("TodoParentheses", "([^)]*)")

  -- Başlıklar
  vim.fn.matchadd("TodoHeader",  "^---.*---$")
  vim.fn.matchadd("TodoSection", "^#.*$")
end

apply_matches()
