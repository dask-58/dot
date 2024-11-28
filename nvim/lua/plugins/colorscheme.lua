return {
  { "rebelot/kanagawa.nvim" },
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
