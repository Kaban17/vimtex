# vimtex

# Neovim Configuration

## Leader Key

The leader key in this configuration is set to the default ` ` (space). Most custom keybindings use this leader key as a prefix.

## General Keymaps

| Keybinding | Description |
|------------|-------------|
| `;` | Enter command mode (`:`) |
| `<leader>e` | Toggle Neotree file explorer |
| `<C-n>` | Focus Neotree (without toggling) |
| `<leader>r` | Reveal current file in Neotree |
| `<leader>ft` | Find TODOs with Telescope |
| `<leader>ff` | Find files with Telescope |
| `<leader>fr` | Browse recent files |
| `<leader>fs` | Find string in current working directory |
| `<leader>fc` | Find string under cursor |
| `<Tab>` | Move to next buffer |
| `<S-Tab>` | Move to previous buffer |
| `<leader>bd` | Delete current buffer |
| `<leader>br` | Delete buffers to the right |
| `<leader>bb` | Switch to other buffer |
| `jk` | Escape from insert mode |

## Clipboard Operations

| Keybinding | Description |
|------------|-------------|
| `<leader>y` | Copy to system clipboard |
| `<leader>Y` | Copy line to system clipboard |
| `<leader>p` | Paste from system clipboard |
| `<leader>P` | Paste from system clipboard before cursor |
| `<leader>y` (visual mode) | Copy selection to system clipboard |
| `<leader>p` (visual mode) | Paste from system clipboard |

## LSP Keybindings

This configuration includes LSP support for Python, C/C++, Rust, and Golang. The following standard LSP keybindings are available:

| Keybinding | Description | 
|------------|-------------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Show hover information |
| `<C-k>` | Show signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>f` | Format document |
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `<leader>e` | Show line diagnostics |
| `<leader>q` | Add diagnostic to quickfix list |

To use these keybindings, add the following to your `lua/config/keymaps.lua` file:

```lua
-- Add these LSP keybindings
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    
    -- Buffer local mappings
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    
    -- Diagnostic keybindings
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  end,
})
```

This configuration has LSP support for:
- Python (via pyright)
- C/C++ (via clangd)
- Rust (via rust_analyzer)
- Golang (via gopls)
