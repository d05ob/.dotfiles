# 🛠️ My Dotfiles Setup

A curated and minimal dotfiles setup tailored for a suckless-inspired Linux environment with Neovim as the primary code editor.

---

## 📦 Contents

```
.
├── .bash_profile
├── .bashrc
├── .config
│   ├── dmenu
│   ├── dwm
│   ├── nvim
│   ├── st
│   └── wallpapers
├── configlinker.sh
├── .xinitrc
├── .tmux.conf
└── README.md
```

---

## 🧠 Overview

### 🪟 Window Management

* **dwm**: Dynamic Window Manager with custom patches
* **dmenu**: Lightweight menu for launching apps
* **st**: Simple Terminal with additional patches for usability

### 📝 Neovim

* Written in **Lua**
* Plugin Manager: **lazy.nvim**
* Features:

  * LSP support via `mason.nvim` and `nvim-lspconfig`
  * Autocompletion with `nvim-cmp`
  * Fuzzy finding with `telescope.nvim`
  * UI enhancements with `lualine.nvim`, `bufferline.nvim`, and `catppuccin`
  * Syntax highlighting via `nvim-treesitter`
  * File management with `neo-tree.nvim`

### 🧰 Shell & System

* **.bashrc / .bash_profile**: Custom prompt, Git branch integration, environment setup and tmux auto-start for interactive shells
* **.tmux.conf**: Clean tmux status bar and navigation
* **.xinitrc**: X session startup including wallpaper setup
* **configlinker.sh**: A custom script to link config files correctly

---

## 📁 .config Breakdown

### dmenu

* Patched for custom behavior and appearance
* Includes launch scripts like `dmenu_run`

### dwm

* Custom build with patches:

  * actualfullscreen
  * alwayscenter
  * fullgaps
  * movestack
  * resizehere

### st

* Patched with `anysize` and other usability improvements

### nvim

* Modular config:

  * `init.lua`: Main entrypoint
  * `manager.lua`: Lazy.nvim plugin manager and plugin list
  * `options.lua`: Editor settings
  * `keymaps.lua`: Custom mappings
  * `lsp.lua`: Language server setup
  * `plugin_configs/`: Individual plugin configurations

### wallpapers

* A collection of personal wallpapers used in `.xinitrc`

---

## 🚀 Installation

Clone and configure:

```bash
git clone https://github.com/d0sob/.dotfiles.git ~/.dotfiles
mkdir ~/.config # if you haven't already
cd ~/.dotfiles
sh ./configlinker.sh
```

Manually link files if needed:

```bash
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim
```

---

## 🧪 Requirements

* `neovim` >= 0.11
* `tmux`
* `xorg`, `xinit`
* `dwm`, `dmenu`, `st` (from included source)
* Common GNU utilities

---

## 🙏 Credits

* [suckless.org](https://suckless.org)
* [Lazy.nvim](https://github.com/folke/lazy.nvim)
* [Neovim LSP Ecosystem](https://github.com/neovim/nvim-lspconfig)
* Plugin authors and patch maintainers

---

> ⚠️ These dotfiles are tailored to my personal workflow. Use them as inspiration or adjust as needed for your environment.

