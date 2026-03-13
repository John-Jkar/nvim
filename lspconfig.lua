-- ============================================================================
-- configs/lspconfig.lua — Language Server Protocol configuration
--
-- To add more servers:
--   1. Install the server with Mason: :MasonInstall <server>
--   2. Add the server name to the `servers` table below
--
-- Available servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- ============================================================================

-- Load NvChad's default LSP keybindings and handlers
require("nvchad.configs.lspconfig").defaults()

-- List of LSP servers to enable
local servers = {
  "html",   -- HTML language server
  "cssls",  -- CSS language server
  -- "pyright",       -- Python
  -- "gopls",         -- Go
  -- "rust_analyzer", -- Rust
  -- "ts_ls",         -- TypeScript / JavaScript
  -- "lua_ls",        -- Lua
  -- "clangd",        -- C / C++
}

vim.lsp.enable(servers)

-- Optional: per-server custom settings
-- Example:
-- vim.lsp.config("lua_ls", {
--   settings = {
--     Lua = {
--       diagnostics = { globals = { "vim" } },
--     },
--   },
-- })
