local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      return require "nvchad.configs.telescope"
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function() require('competitest').setup() end,
  },
 
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")

        mc.setup()

        -- Add cursors above/below the main cursor.
        vim.keymap.set({"n", "v"}, "<up>", function() mc.addCursor("k") end)
        vim.keymap.set({"n", "v"}, "<down>", function() mc.addCursor("j") end)

        -- Add a cursor and jump to the next word under cursor.
        vim.keymap.set({"n", "v"}, "<c-n>", function() mc.addCursor("*") end)

        -- Jump to the next word under cursor but do not add a cursor.
        vim.keymap.set({"n", "v"}, "<c-s>", function() mc.skipCursor("*") end)

        -- Rotate the main cursor.
        vim.keymap.set({"n", "v"}, "<left>", mc.nextCursor)
        vim.keymap.set({"n", "v"}, "<right>", mc.prevCursor)

        -- Delete the main cursor.
        vim.keymap.set({"n", "v"}, "<leader>x", mc.deleteCursor)

        -- Add and remove cursors with control + left click.
        vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

        vim.keymap.set({"n", "v"}, "<c-q>", function()
            if mc.cursorsEnabled() then
                -- Stop other cursors from moving.
                -- This allows you to reposition the main cursor.
                mc.disableCursors()
            else
                mc.addCursor()
            end
        end)

        vim.keymap.set("n", "<esc>", function()
            if not mc.cursorsEnabled() then
                mc.enableCursors()
            elseif mc.hasCursors() then
                mc.clearCursors()
            else
                -- Default <esc> handler.
            end
        end)

        -- Align cursor columns.
        vim.keymap.set("n", "<leader>a", mc.alignCursors) 

        -- Split visual selections by regex.
        vim.keymap.set("v", "S", mc.splitCursors)

        -- Append/insert for each line of visual selections.
        vim.keymap.set("v", "I", mc.insertVisual)
        vim.keymap.set("v", "A", mc.appendVisual)

        -- match new cursors within visual selections by regex.
        vim.keymap.set("v", "M", mc.matchCursors)

        -- Rotate visual selection contents.
        vim.keymap.set("v", "<leader>t", function() mc.transposeCursors(1) end)
        vim.keymap.set("v", "<leader>T", function() mc.transposeCursors(-1) end)

        -- Customize how cursors look.
        vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
        vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
        vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
        vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        end,
    },

  {
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
  },
  -- LSP manager
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  -- Auto-completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
      "hrsh7th/cmp-buffer", -- buffer auto-completion
      "hrsh7th/cmp-path", -- path auto-completion
      "hrsh7th/cmp-cmdline", -- cmdline auto-completion
    },
    config = function()
      require("config.nvim-cmp")
    end,
  },
  -- Auto-Pairs
  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- setup cmp for autopairs
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  -- Code snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
  },
  -- Theme
  "loctvl842/monokai-pro.nvim",
  "catppuccin/nvim",
  "navarasu/onedark.nvim",
})

