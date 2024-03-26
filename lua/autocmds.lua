-- Contains all custom auto-commands for VIm editor

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Reset cursor on exiting VIm
local resetCursorShapeOnExit = augroup("ResetCursorShapeOnExit", { clear = true })
autocmd("VimLeave", {
  group = resetCursorShapeOnExit,
  command = "set guicursor=a:hor10-blinkon1"
})
