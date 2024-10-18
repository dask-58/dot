local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {"karb94/neoscroll.nvim"},
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { 'echasnovski/mini.statusline', version = '*' },
   --  "mfussenegger/nvim-dap",
    {
        "kyazdani42/nvim-tree.lua",
        enabled = false,
        init = function()
            vim.api.nvim_create_autocmd({ "BufEnter" }, {
                callback = function(args)
                    if vim.fn.isdirectory(args.match) == 1 then
                        require("lazy").load({ plugins = { "nvim-tree.lua" } })
                        vim.cmd("NvimTreeToggle")
                        return true
                    end
                end,
            })
        end,
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        keys = { "<leader>nt", "<leader>nf" },
        config = function()
            require("config.nvim-tree")
        end,
    },
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {"nvim-tree/nvim-web-devicons"}
        },
        {
        "nvim-telescope/telescope.nvim",
        keys = { "<leader>f", "<leader><space>", "<leader>k", "<leader>T" },
        cmd = "Telescope",
        enabled = true,
        dependencies = {
            {
                "nvim-telescope/telescope-frecency.nvim",
                config = function()
                    vim.keymap.set(
                        "n",
                        "<leader>fr",
                        require("telescope").extensions.frecency.frecency,
                        { desc = "Telescope: Frecency" }
                    )
                end,
            },
            {
                "nvim-telescope/telescope-file-browser.nvim",
                config = function()
                    vim.keymap.set(
                        "n",
                        "<leader>f.",
                        require("telescope").extensions.file_browser.file_browser,
                        { desc = "Telescope: File browser" }
                    )
                end,
            },
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-dap.nvim",
            {
                "nvim-telescope/telescope-ui-select.nvim",
                init = function()
                    vim.ui.select = function(...)
                        require("lazy").load({ plugins = { "telescope.nvim" } })
                        vim.ui.select(...)
                    end
                end,
            },
        },
        config = function()
            require("config.telescope")

            require("telescope").load_extension("file_browser")
            -- require("telescope").load_extension("dap")
            -- require("telescope").load_extension("notify")
            -- require("telescope").load_extension("fzf")
            require("telescope").load_extension("frecency")
            require("telescope").load_extension("ui-select")
        end,
    },
        {
            "xeluxee/competitest.nvim",
            dependencies = "MunifTanjim/nui.nvim",
            config = function()
                require("competitest").setup()
            end
        },
        {
            "onsails/lspkind.nvim",
            event = {"VimEnter"}
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
                "hrsh7th/cmp-cmdline" -- cmdline auto-completion
            },
            config = function()
                require("config.nvim-cmp")
            end
        },
        -- Dashboard
        {
            -- Go Glepnir!
            "glepnir/dashboard-nvim",
            event = "VimEnter",
            enabled = true,
            config = function()
                require("config.dashboard")
                vim.keymap.set("n", "<F3>", "<cmd>Dashboard<CR>", { desc = "Dashboard: open" })
                end,
        },
        -- Auto-Pairs
        {
            "windwp/nvim-autopairs",
            opts = {
                fast_wrap = {},
                disable_filetype = {"TelescopePrompt", "vim"}
            },
            config = function(_, opts)
                require("nvim-autopairs").setup(opts)

                -- setup cmp for autopairs
                local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end
        },
        -- Code snippet engine
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*"
        },
        -- Key screen
        "tamton-aquib/keys.nvim",
        -- Theme
        "rebelot/kanagawa.nvim",
        "loctvl842/monokai-pro.nvim",
        "catppuccin/nvim",
        "navarasu/onedark.nvim"
    }
)
