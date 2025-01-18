return {
  { "rebelot/kanagawa.nvim" },
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "eldritch-theme/eldritch.nvim", lazy = false, priority = 1000, opts = {} },
  -- Load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "eldritch",
    },
  },
}
