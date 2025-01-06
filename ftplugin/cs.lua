call = vim.call
cmd = vim.cmd
g = vim.g

local function map(mode, lhs, rhs, opts)
local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function imap(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

local function nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

local function vmap(lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

nmap('<leader>cc', '<cmd>!dotnet build<cr>', {desc = 'Build dotnet code'})
nmap('<leader>crc', '<cmd>!dotnet run<cr>', {desc = 'Run dotnet code'})
nmap('<leader>crt', '<cmd>!dotnet test<cr>', {desc = 'Test dotnet code'})
nmap('<leader>cd', '<cmd>:OmniSharpDocumentation<cr>', {desc = 'Show documentation for current location'})
nmap('<leader>cfu', '<cmd>:OmniSharpFindUsages<cr>', {desc = 'Find usages of current symbol'})
nmap('<leader>ci', '<cmd>:OmniSharpFindImplementations<cr>', {desc = 'Find implementations of current symbol'})
nmap('<leader>cn', '<cmd>:OmniSharpGotoDefinition<cr>', {desc = 'Go to definition of current symbol'})
nmap('<leader>cfi', '<cmd>:OmniSharpFixUsings<cr>', {desc = 'Fix usings'})
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = '*.cs',
--   group = vim.api.nvim_create_augroup('*.cs', { clear = true }),
--   callback = function()
--     
--   end
-- })

opt.tabstop   =4
opt.expandtab =true
opt.shiftwidth=4
