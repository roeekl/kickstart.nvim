# Minimal Neovim Configuration

Modern Neovim configuration using native `vim.pack` for Neovim 0.11.5+

## Features

- No plugin manager dependency (uses native vim.pack)
- Fast startup with lazy loading
- LSP support via Mason
- Fuzzy finding with Telescope
- Git integration with Gitsigns
- Autocompletion with nvim-cmp
- Treesitter syntax highlighting
- Auto-formatting with Conform

## Installation

### Requirements

- Neovim 0.11.5+
- Git
- make (for telescope-fzf-native)
- ripgrep (for telescope live grep)

### First Time Setup

1. Start Neovim - plugins will auto-install on first run
2. Wait for git clones to complete
3. Run `:checkhealth` to verify setup
4. For telescope-fzf, run `:TSUpdate` after first launch

## File Structure

```
init.lua          - Main configuration
lua/pack.lua      - Plugin management
```

## Adding Plugins

Edit the `pack.setup({})` table in `init.lua`:

```lua
{
  'user/repo',
  config = function()
    require('plugin').setup()
  end
}
```

## LSP Servers

Add servers in the `servers` table at init.lua:245

## Key Mappings

Leader: `<Space>`

- `<leader>sf` - Search files
- `<leader>sg` - Search grep
- `<leader>sh` - Search help
- `<leader>f` - Format buffer
- `gd` - Go to definition
- `gr` - Go to references
- `<leader>ca` - Code action
- `<leader>rn` - Rename

