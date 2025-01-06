
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

-- reset sapce as leader key
vim.g.mapleader = ' '

nmap('<C-b>', '<cmd>NERDTreeToggle<cr>', {desc = 'Toggle NERDTree'})

-- Copilot
imap('<C-n>', '<plug>(copilot-next)', {desc = 'Copilot Next'})
imap('<C-p>', '<plug>(copilot-prev)', {desc = 'Copilot Prev'})
imap('<C-space>', '<plug>(copilot-snippet)', {desc = 'Copilot Snippet'})
imap('<C-e>', '<plug>(copilot-expand)', {desc = 'Copilot Expand'})

nmap('<M-Right>', '<cmd>bn<cr>', {desc = 'Next Buffer'})
nmap('<M-Left>', '<cmd>bp<cr>', {desc = 'Prev Buffer'})
nmap('<M-Up>', '<cmd>ls<cr>:b', {desc = 'List Buffer'})
nmap('<M-Down>', '<cmd>bd<cr>', {desc = 'Delete Buffer'})

-- Telescope
nmap(';', '<cmd>Telescope find_files<cr>', {desc = 'Find Files'})
nmap('<leader>ff', '<cmd>Telescope find_files<cr>', {desc = 'Find Files'})
nmap('<M-p>', '<cmd>Telescope<cr>', {desc = 'Open Telescope'})

-- map vimspector to leader key
nmap('<leader>rc', '<cmd>call vimspector#Run()<cr>', {desc = 'Run code with vimspector'})
nmap('<leader>rq', '<cmd>call vimspector#Reset()<cr>', {desc = 'Reset vimspector'})
nmap('<leader>rs', '<cmd>call vimspector#Restart()<cr>', {desc = 'Restart vimspector'})
nmap('<leader>st', '<cmd>call vimspector#StepInto()<cr>', {desc = 'Step Into'})
nmap('<leader>so', '<cmd>call vimspector#StepOut()<cr>', {desc = 'Step Out'})
nmap('<leader>sn', '<cmd>call vimspector#StepOver()<cr>', {desc = 'Step Over'})
nmap('<leader>sb', '<cmd>call vimspector#ToggleBreakpoint()<cr>', {desc = 'Toggle Breakpoint'})
nmap('<leader>sc', '<cmd>call vimspector#Continue()<cr>', {desc = 'Continue'})
nmap('<leader>se', '<Plug>VimspectorToggleConditionalBreakpoint', {desc = 'Toggle Breakpoint with condition'})
nmap('<leader>sv', '<Plug>VimspectorBalloonEval', {desc = 'Evaluate expression under cursor'})
