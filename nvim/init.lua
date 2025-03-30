-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Open Dashboard by default if no file passed by cmd.
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("Dashboard")
    end
  end,
})
