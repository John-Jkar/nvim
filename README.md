# 🚀 My Neovim Config

A fast, modern Neovim setup built on **NvChad v2.5** with a universal launcher feel — inspired by Emacs' `universal-launcher.el`.

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

---

## 📁 Directory Structure

```
~/.config/nvim/
├── init.lua                    # Entry point — bootstraps lazy.nvim + NvChad
└── lua/
    ├── mappings.lua            # All custom keybindings
    ├── options.lua             # Neovim options
    ├── autocmds.lua            # Autocommands
    ├── chadrc.lua              # NvChad theme/UI config
    ├── plugins/
    │   └── init.lua            # Custom plugin definitions
    └── configs/
        ├── lazy.lua            # lazy.nvim config
        ├── lspconfig.lua       # LSP server setup
        └── conform.lua         # Formatter setup
```

---

## ⚡ Features

- **NvChad v2.5** base — fast startup, beautiful UI, built-in Telescope
- **Universal Launcher** via Telescope — fuzzy find anything with `Space Space`
- **Frecency** — smart recent files ranked by how often you use them
- **Harpoon 2** — pin up to 4 files and jump between them instantly
- **Floating Terminal** — toggle a terminal overlay with `Space tt`
- **Web Search** — search DuckDuckGo directly from Neovim with `Space fw`
- **LSP** — HTML and CSS language servers out of the box
- **Formatting** — Stylua for Lua files via conform.nvim

---

## 🔌 Plugins

### Core (via NvChad)
| Plugin | Purpose |
|--------|---------|
| `NvChad/NvChad` | Base framework — UI, themes, defaults |
| `nvim-telescope/telescope.nvim` | Fuzzy finder — the heart of the launcher |
| `nvim-treesitter/nvim-treesitter` | Syntax highlighting |
| `neovim/nvim-lspconfig` | LSP configuration |
| `nvim-tree/nvim-tree.lua` | File explorer |
| `hrsh7th/nvim-cmp` | Autocompletion |
| `stevearc/conform.nvim` | Code formatting |
| `lewis6991/gitsigns.nvim` | Git integration |
| `folke/which-key.nvim` | Keybinding hints |

### Custom
| Plugin | Purpose |
|--------|---------|
| `ThePrimeagen/harpoon` (v2) | Pin frequently used files |
| `akinsho/toggleterm.nvim` | Floating terminal |
| `nvim-telescope/telescope-frecency.nvim` | Smart recent files with frecency scoring |

---

## ⌨️ Keybindings

> Leader key is `Space`

### 🚀 Launcher
| Key | Action |
|-----|--------|
| `Space Space` | Open full launcher (all Telescope pickers) |
| `Space ff` | Find files |
| `Space fr` | Recent files with frecency scoring |
| `Space fb` | Open buffers |
| `Space fg` | Live grep — search inside project |
| `Space fw` | Web search via DuckDuckGo |

### 📋 Utilities
| Key | Action |
|-----|--------|
| `Space fy` | Registers / clipboard history |
| `Space fm` | Marks as bookmarks |
| `Space tt` | Toggle floating terminal |
| `C-\` | Toggle floating terminal (alternate) |

### 🐟 Harpoon (pinned files)
| Key | Action |
|-----|--------|
| `Space ha` | Pin current file |
| `Space hh` | Jump to pinned file 1 |
| `Space hj` | Jump to pinned file 2 |
| `Space hk` | Jump to pinned file 3 |
| `Space hl` | Jump to pinned file 4 |

### 🔠 General
| Key | Action |
|-----|--------|
| `;` | Enter command mode (instead of `:`) |
| `jk` | Exit insert mode (instead of `Esc`) |
| `Space th` | Change theme (NvChad built-in) |
| `Space ch` | Cheatsheet of all mappings |

---

## 🛠️ LSP & Formatting

### Language Servers
| Language | Server |
|----------|--------|
| HTML | `html` (via nvim-lspconfig) |
| CSS | `cssls` (via nvim-lspconfig) |

### Formatters
| Language | Formatter |
|----------|-----------|
| Lua | `stylua` |

To add more LSP servers, edit `lua/configs/lspconfig.lua`:
```lua
local servers = { "html", "cssls", "pyright", "gopls" }
```

To add more formatters, edit `lua/configs/conform.lua`:
```lua
formatters_by_ft = {
  lua = { "stylua" },
  python = { "black" },
  javascript = { "prettier" },
}
```

---

## 📦 Installation

### Prerequisites
```bash
# Required
sudo apt install neovim git ripgrep fd-find

# Optional (for web search)
# xdg-open is usually pre-installed on Linux desktops
```

### Install
```bash
# Back up existing config if you have one
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this config
git clone https://github.com/YOUR_USERNAME/nvim-config ~/.config/nvim

# Open Neovim — lazy.nvim will auto-install all plugins
nvim
```

On first launch, lazy.nvim will install everything automatically. Wait for it to finish, then restart Neovim.

### Install icon fonts (required for icons)
Inside Neovim:
```
:Telescope
```
NvChad handles icon fonts via its base46 theme system automatically.

---

## 🎨 Customization

### Change theme
```
Space th
```
NvChad includes 60+ themes out of the box.

### Add custom plugins
Edit `lua/plugins/init.lua` and add entries to the `return {}` table, then run `:Lazy sync`.

### Add custom keybindings
Edit `lua/mappings.lua` and add lines using:
```lua
map("n", "<leader>xx", function() ... end, { desc = "Description" })
```


## 📝 Notes

- Config is built on **NvChad v2.5** — refer to [NvChad docs](https://nvchad.com/docs/quickstart/install) for base configuration options
- Harpoon keybindings use lazy-loading — they activate on first Harpoon load
- Frecency history is stored in `~/.local/share/nvim/`
- The web search binding opens your default browser via `xdg-open`
