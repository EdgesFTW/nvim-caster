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
          name = 'GradS3',
          path = '/home/edges/OneDrive/Obsidian/Grad S3',
        },
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
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = 'dailies',
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = '%Y-%m-%d',
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = '%B %-d, %Y',
        -- Optional, default tags to add to each new daily note created.
        default_tags = { 'daily-notes' },
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },

      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
      },

      -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
      ui = {
        enable = true, -- set to false to disable all additional syntax features
        update_debounce = 200, -- update delay after a text change (in milliseconds)
        max_file_length = 5000, -- disable UI features for files with more than this many lines
        -- Define how various check-boxes are displayed
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          ['x'] = { char = '', hl_group = 'ObsidianDone' },
          ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
          ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
          ['!'] = { char = '', hl_group = 'ObsidianImportant' },
          -- Replace the above with this if you don't have a patched font:
          -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

          -- You can also add more custom ones...
        },
        -- Use bullet marks for non-checkbox lists.
        bullets = { char = '•', hl_group = 'ObsidianBullet' },
        external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
        -- Replace the above with this if you don't have a patched font:
        -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = 'ObsidianRefText' },
        highlight_text = { hl_group = 'ObsidianHighlightText' },
        tags = { hl_group = 'ObsidianTag' },
        block_ids = { hl_group = 'ObsidianBlockID' },
        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { bold = true, fg = '#f78c6c' },
          ObsidianDone = { bold = true, fg = '#89ddff' },
          ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
          ObsidianTilde = { bold = true, fg = '#ff5370' },
          ObsidianImportant = { bold = true, fg = '#d73128' },
          ObsidianBullet = { bold = true, fg = '#89ddff' },
          ObsidianRefText = { underline = true, fg = '#c792ea' },
          ObsidianExtLinkIcon = { fg = '#c792ea' },
          ObsidianTag = { italic = true, fg = '#89ddff' },
          ObsidianBlockID = { italic = true, fg = '#89ddff' },
          ObsidianHighlightText = { bg = '#75662e' },
        },
      },

      -- see below for full list of options 👇
    },
    init = function() -- This is the function that runs, AFTER loading
      vim.keymap.set('n', '<leader>oo', vim.cmd.ObsidianOpen, { desc = 'Obsidian [O]pen' })
      vim.keymap.set('n', '<leader>ow', vim.cmd.ObsidianWorkspace, { desc = 'Obsidian [W]orkspace' })
      vim.keymap.set('n', '<leader>oq', vim.cmd.ObsidianQuickSwitch, { desc = 'Obsidian [Q]uick Switch' })
      vim.keymap.set('n', '<leader>os', vim.cmd.ObsidianSearch, { desc = 'Obsidian [S]earch' })
      vim.keymap.set('n', '<leader>or', vim.cmd.ObsidianRename, { desc = 'Obsidian [R]ename' })
      vim.keymap.set('n', '<leader>on', vim.cmd.ObsidianNew, { desc = 'Obsidian [N]ew' })
      vim.keymap.set('n', '<leader>oe', vim.cmd.ObsidianDailies, { desc = 'Obsidian T[e]mplates' })
      vim.keymap.set('n', '<leader>od', vim.cmd.ObsidianDailies, { desc = 'Obsidian [D]ailies' })
      vim.keymap.set('n', '<leader>oy', vim.cmd.ObsidianYesterday, { desc = 'Obsidian [Y]esterday' })
      vim.keymap.set('n', '<leader>otd', vim.cmd.ObsidianToday, { desc = 'Obsidian [T]o[d]ay' })
      vim.keymap.set('n', '<leader>otm', vim.cmd.ObsidianTomorrow, { desc = 'Obsidian [T]o[m]orrow' })
      vim.keymap.set('n', '<leader>opi', vim.cmd.ObsidianPasteImg, { desc = 'Obsidian [P]aste [I]mage' })
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
      'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
      { 'MeanderingProgrammer/render-markdown.nvim', ft = { 'markdown', 'codecompanion' } }, -- Optional: For prettier markdown rendering
      { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    opts = {
      strategies = {
        chat = {
          adapter = 'ollama',
        },
        inline = {
          adapter = 'ollama',
        },
      },
      adapters = {
        opts = {
          allow_insecure = true,
        },
        ollama = function()
          return require('codecompanion.adapters').extend('ollama', {
            env = {
              url = 'http://desktop-ak5t:11434',
            },
            schema = {
              model = {
                -- default = 'llama3.2-vision:latest',
                default = 'qwen2.5-coder:32b',
              },
              -- num_ctx = {
              --   default = 16384,
              -- },
              -- num_predict = {
              --   default = -1,
              -- },
            },
            parameters = {
              sync = true,
            },
          })
        end,
      },
    },
    config = true,
    init = function() -- This is the function that runs, AFTER loading
      vim.keymap.set('n', '<leader>ai', vim.cmd.CodeCompanion, { desc = '[A]rtificial [I]nteligence' })
      vim.keymap.set('n', '<leader>ac', vim.cmd.CodeCompanionChat, { desc = '[A]rtificial Inteligence [C]hat' })
      vim.keymap.set('n', '<leader>aa', vim.cmd.CodeCompanionActions, { desc = '[A]rtificial Inteligence [A]ctions' })
    end,
  },
  { 'github/copilot.vim' },
}
