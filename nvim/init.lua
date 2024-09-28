require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('lsp')
require('competitest').setup()
require('lualine').setup() -- {
 --    sections = {
   --     lualine_a = {
     --  {
       --         'datetime',
                -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
         --       style = 'default'
           -- }
        --}
    --}
    --  options = { theme = material }
--}
--
require("keys").setup {
    enable_on_startup = true,
    win_opts = {
        width = 25,
        -- etc
    },
    -- TODO: more options later
}
