-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.fileformat = "unix"

--vim.opt.guifont = "JetBrainsMono_Nerd_Font:h13:#h-normal"
--vim.opt.guicursor = "i:ver25-blinkwait100-blinkon500-blinkoff500"

vim.lsp.set_log_level("off")

if vim.fn.has("win32") == 1 then
	vim.opt.shell = "pwsh"
	vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	vim.opt.shellredir = "| Out-File -Encoding UTF8"
	vim.opt.shellpipe = "|"
	vim.opt.shellxquote = ""
else
	vim.opt.shell = "zsh"
end

if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0.1
end
