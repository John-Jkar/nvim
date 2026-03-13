-- ============================================================================
-- mappings.lua — Custom keybindings
-- Leader key: Space
-- ============================================================================

require "nvchad.mappings"

local map = vim.keymap.set

-- ----------------------------------------------------------------------------
-- General
-- ----------------------------------------------------------------------------
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- ----------------------------------------------------------------------------
-- Telescope — Universal Launcher
-- ----------------------------------------------------------------------------
local builtin = require "telescope.builtin"
local telescope = require "telescope"

-- 🚀 Main launcher (all Telescope pickers)
map("n", "<leader><leader>", builtin.builtin, { desc = "Launcher: All pickers" })

-- 📂 Files
map("n", "<leader>fr", function()
  telescope.extensions.frecency.frecency()
end, { desc = "Launcher: Recent files (frecency)" })

-- 📋 Clipboard / registers (equivalent to Emacs kill-ring)
map("n", "<leader>fy", builtin.registers, { desc = "Launcher: Registers" })

-- 🔖 Marks as bookmarks
map("n", "<leader>fm", builtin.marks, { desc = "Launcher: Marks" })

-- 🌐 Web search (opens DuckDuckGo in default browser)
map("n", "<leader>fw", function()
  local query = vim.fn.input "🌐 Search: "
  if query ~= "" then
    local encoded = query:gsub(" ", "+")
    vim.fn.jobstart { "xdg-open", "https://duckduckgo.com/?q=" .. encoded }
  end
end, { desc = "Launcher: Web search" })

-- ----------------------------------------------------------------------------
-- Terminal
-- ----------------------------------------------------------------------------

-- ⚡ Floating terminal
map("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Launcher: Float terminal" })

-- ----------------------------------------------------------------------------
-- Harpoon — pinned file navigation
-- Loads lazily: keymaps register when Harpoon plugin first loads
-- ----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  callback = function(event)
    if event.data == "harpoon" then
      local harpoon = require "harpoon"
      map("n", "<leader>ha", function() harpoon:list():add() end,     { desc = "Harpoon: Pin file" })
      map("n", "<leader>hh", function() harpoon:list():select(1) end, { desc = "Harpoon: File 1" })
      map("n", "<leader>hj", function() harpoon:list():select(2) end, { desc = "Harpoon: File 2" })
      map("n", "<leader>hk", function() harpoon:list():select(3) end, { desc = "Harpoon: File 3" })
      map("n", "<leader>hl", function() harpoon:list():select(4) end, { desc = "Harpoon: File 4" })
    end
  end,
})
