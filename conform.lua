-- ============================================================================
-- configs/conform.lua — Code formatter configuration
--
-- To add more formatters:
--   1. Install the formatter tool on your system (e.g. `npm i -g prettier`)
--   2. Add the filetype + formatter name to `formatters_by_ft` below
--
-- To enable format-on-save, uncomment the `format_on_save` block.
-- ============================================================================

local options = {

  -- Map filetypes to their formatters
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    -- javascript = { "prettier" },
    -- typescript = { "prettier" },
    -- python = { "black" },
    -- go = { "gofmt" },
    -- rust = { "rustfmt" },
  },

  -- Uncomment to auto-format on save
  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
