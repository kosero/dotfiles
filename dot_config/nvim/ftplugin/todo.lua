local function set_highlights()
  local set_hl = vim.api.nvim_set_hl

  -- Köşeli parantez kutucukları [x], [y], [d], [?]
  set_hl(0, "TodoDone",    { link = "DiagnosticOk", bold = true })
  set_hl(0, "TodoDoing",   { link = "DiagnosticWarn", bold = true })
  set_hl(0, "TodoPaused",  { link = "DiagnosticInfo", bold = true })
  set_hl(0, "TodoUnknown", { link = "DiagnosticHint", bold = true })
  set_hl(0, "TodoPending", { link = "Comment" })

  -- Normal parantezler (...) ve içindekiler için temanın satır numarası rengi (orta solukluk)
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
  -- Eski match'leri temizle
  for _, match in ipairs(vim.fn.getmatches()) do
    if match.group:sub(1, 4) == "Todo" then
      vim.fn.matchdelete(match.id)
    end
  end

  -- Köşeli parantez kutucukları [ ]
  vim.fn.matchadd("TodoDone",    "^\\[x\\]")
  vim.fn.matchadd("TodoDoing",   "^\\[y\\]")
  vim.fn.matchadd("TodoPaused",  "^\\[d\\]")
  vim.fn.matchadd("TodoUnknown", "^\\[\\?\\]")
  vim.fn.matchadd("TodoPending", "^\\[ \\?\\]")

  -- Normal parantezler (...) ve içindeki metinler
  vim.fn.matchadd("TodoParentheses", "([^)]*)")

  -- Başlıklar
  vim.fn.matchadd("TodoHeader",  "^---.*---$")
  vim.fn.matchadd("TodoSection", "^#.*$")
end

apply_matches()
