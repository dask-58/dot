-- local colorscheme = 'monokai-pro'
-- local colorscheme = 'catppuccin-mocha'
local colorscheme = 'onedark'

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
