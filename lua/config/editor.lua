g.vimspector_enable_mappings = 'VISUAL_STUDIO'

g.copilot_filetypes = {yaml = true}

opt.tabstop   =2
opt.expandtab =true
opt.shiftwidth=2
opt.number    =true
opt.relativenumber=true

g.airline_powerline_fonts = 1
g["airline#extensions#tabline#enabled"] = 1

vim.wo.colorcolumn = '120'
opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}

require('gitsigns').setup()
