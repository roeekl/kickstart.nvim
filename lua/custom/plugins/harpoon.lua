return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope.nvim', tag = '0.1.5' } },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>pl', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })

    vim.keymap.set('n', '<leader>pa', function()
      harpoon:list():append()
    end, { desc = 'Append File' })

    vim.keymap.set('n', '<leader>p1', function()
      harpoon:list():select(1)
    end, { desc = 'Select 1' })
    vim.keymap.set('n', '<leader>p2', function()
      harpoon:list():select(2)
    end, { desc = 'Select 2' })
    vim.keymap.set('n', '<leader>p3', function()
      harpoon:list():select(3)
    end, { desc = 'Select 3' })
    vim.keymap.set('n', '<leader>p4', function()
      harpoon:list():select(4)
    end, { desc = 'Select 4' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>pj', function()
      harpoon:list():prev()
    end, { desc = 'Previous' })
    vim.keymap.set('n', '<leader>pk', function()
      harpoon:list():next()
    end, { desc = 'Next' })
  end,
}
