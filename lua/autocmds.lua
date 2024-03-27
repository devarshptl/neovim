-- Contains all custom auto-commands for VIm editor

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Cursor
local cursorGroup = augroup("CursorGroup", { clear = true })
autocmd("VimLeave", {
  group = cursorGroup,
  command = "set guicursor=a:hor10-blinkon1",
})

-- Buffer
local bufferGroup = augroup("BufferGroup", { clear = true })
autocmd("BufWritePre", {
  group = bufferGroup,
  callback = function()
    vim.lsp.buf.format()
  end,
})
