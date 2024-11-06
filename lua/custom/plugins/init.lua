-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'mbbill/undotree',
    config = function() -- This is the function that runs, AFTER loading
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'UndotreeToggle' })
      -- vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end,
  },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura_simple'
    end,
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'tpope/vim-rhubarb',
  },
  {
    'shumphrey/fugitive-gitlab.vim',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      -- setup treesitter with config
    end,
    dependencies = {
      -- NOTE: additional parser
      { 'nushell/tree-sitter-nu', build = ':TSUpdate nu' },
    },
    build = ':TSUpdate',
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'GradS2',
          path = '/home/edges/OneDrive/Obsidian/Grad S2',
        },
        {
          name = 'GradS1',
          path = '~/OneDrive/Obsidian/Grad S1 Vault',
        },
        {
          name = 'GradSU',
          path = '~/OneDrive/Obsidian/Grad-SU-Valt',
        },
      },

      -- see below for full list of options 👇
    },
    init = function() -- This is the function that runs, AFTER loading
      vim.keymap.set('n', '<leader>oo', vim.cmd.ObsidianOpen, { desc = 'Obsidian [O]pen' })
      vim.keymap.set('n', '<leader>ow', vim.cmd.ObsidianWorkspace, { desc = 'Obsidian [W]orkspace' })
      vim.keymap.set('n', '<leader>oq', vim.cmd.ObsidianQuickSwitch, { desc = 'Obsidian [Q]uick Switch' })
      vim.keymap.set('n', '<leader>os', vim.cmd.ObsidianSearch, { desc = 'Obsidian [S]earch' })
      vim.keymap.set('n', '<leader>on', vim.cmd.ObsidianNew, { desc = 'Obsidian [N]ew' })
      vim.keymap.set('n', '<leader>oe', vim.cmd.ObsidianDailies, { desc = 'Obsidian T[e]mplates' })
      vim.keymap.set('n', '<leader>od', vim.cmd.ObsidianDailies, { desc = 'Obsidian [D]ailies' })
      vim.keymap.set('n', '<leader>oy', vim.cmd.ObsidianYesterday, { desc = 'Obsidian [Y]esterday' })
      vim.keymap.set('n', '<leader>otd', vim.cmd.ObsidianToday, { desc = 'Obsidian [T]o[d]ay' })
      vim.keymap.set('n', '<leader>otm', vim.cmd.ObsidianTomorrow, { desc = 'Obsidian [T]o[m]orrow' })
      vim.keymap.set('n', '<leader>opi', vim.cmd.ObsidianPasteImg, { desc = 'Obsidian [P]aste [I]mage' })
    end,
  },
}
