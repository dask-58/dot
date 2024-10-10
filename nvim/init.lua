require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('lsp')
require('competitest').setup()
require('mini.statusline').setup()
require('keys').setup {
    enable_on_startup = true,
    win_opts = {
        width = 25,
        -- etc
    },
    -- TODO: more options later
}
