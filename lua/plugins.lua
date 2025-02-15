call('plug#begin')

Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'preservim/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug ('junegunn/fzf', {
  ['do'] = function()
    vim.call('fzf#install')
  end
})
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nordtheme/vim'
Plug ('neoclide/coc.nvim', {['branch'] = 'release'})
Plug 'nvim-lua/plenary.nvim'
Plug ('nvim-telescope/telescope.nvim', {['tag'] = '0.1.5'})
Plug 'lewis6991/gitsigns.nvim'
Plug 'https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git'
Plug 'OmniSharp/omnisharp-vim'
Plug 'echasnovski/mini.clue'
Plug 'nicwest/vim-http'
Plug 'mechatroner/rainbow_csv'
Plug 'tpope/vim-abolish'

call('plug#end')


local function discarding_plug_update()
  local dirties = {}
  for plug_name, plug_data in pairs(vim.g.plugs) do
    local cmd = string.format("cd %s && git diff --no-ext-diff --name-only", vim.fn.shellescape(plug_data.dir))
    if #vim.fn.system(cmd) > 0 then
      dirties[plug_name] = plug_data
    end
  end

  if next(dirties) then
    for _, plug_data in pairs(dirties) do
      local checkout_cmd = string.format("cd %s && git checkout -f", vim.fn.shellescape(plug_data.dir))
      vim.fn.system(checkout_cmd)
    end
    vim.fn['plug#update']('--sync')
    vim.cmd('PlugInstall! ' .. table.concat(vim.tbl_keys(dirties), ' '))
  else
    vim.fn['plug#update']()
  end
end

vim.api.nvim_create_user_command('DPU', discarding_plug_update, {})
