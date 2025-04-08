local options = { noremap = true, silent = true }
local map = vim.keymap.set
map("n", ";", ":")
map("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
map("n", "<C-n>", "<Cmd>Neotree focus<CR>", { desc = "Focus Neotree" })
map("n", "<leader>r", "<Cmd>Neotree reveal<CR>", { desc = "Reveal file in Neotree" })
map("n", "<leader>ft", "<Cmd>TodoTelescope<CR>", { desc = "Find TODOs" })
map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fs", "<Cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
map("n", "<leader>fc", "<Cmd>Telescope grep_string<CR>", { desc = "Find string under cursor" })
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Move to next buffer" })
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Move to previous buffer" })
map("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete buffers to the right" })
map("n", "<leader>bb", "<Cmd>e #<CR>", { desc = "Switch to other buffer" })

-- Clipboard operations
map("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("n", "<leader>P", '"+P', { desc = "Paste from system clipboard before cursor" })
map("v", "<leader>y", '"+y', { desc = "Copy selection to system clipboard" })
map("v", "<leader>p", '"+p', { desc = "Paste from system clipboard" })

map("i", "jk", "<Esc>", options)

-- Vimtex comands reassigned
-- Change of math mode ds$ --> dsm, cs$ --> csm, ts$ --> tsm
map("n", "dsm", "<Plug>(vimtex-env-delete-math)", { noremap = false, silent = true })
map("n", "csm", "<Plug>(vimtex-env-change-math)", { noremap = false, silent = true })
map("n", "tsm", "<Plug>(vimtex-env-toggle-math)", { noremap = false, silent = true })
-- Change of environment ]m --> ]e, ]M --> ]E, [m-->[e, [M --> [E
map({ "n", "x", "o" }, "]e", "<Plug>(vimtex-]m)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "]E", "<Plug>(vimtex-]M)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "[e", "<Plug>(vimtex-[m)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "[E", "<Plug>(vimtex-[M)", { noremap = false, silent = true })
-- Change of math mode ]n --> ]m, ]N --> ]M, [n-->[m, [N --> [M
map({ "n", "x", "o" }, "]m", "<Plug>(vimtex-]n)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "]M", "<Plug>(vimtex-]N)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "[m", "<Plug>(vimtex-[n)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "[M", "<Plug>(vimtex-[N)", { noremap = false, silent = true })
-- Change of itemize/enumerate environment am --> ai, im --> ii
map({ "x", "o" }, "ai", "<Plug>(vimtex-am)", { noremap = false, silent = true })
map({ "x", "o" }, "ii", "<Plug>(vimtex-im)", { noremap = false, silent = true })
-- Change of math mode a$ --> am, i$ --> im
map({ "x", "o" }, "am", "<Plug>(vimtex-a$)", { noremap = false, silent = true })
map({ "x", "o" }, "im", "<Plug>(vimtex-i$)", { noremap = false, silent = true })

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
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  end,
})
