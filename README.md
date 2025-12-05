# My Neovim config
---
I use this configuration in Termux and Arch Linux (with KDE Plasma)
All with Tmux too (sometimes).
---

# Features included:
## Package Manager
### **Lazy**

## Language Server Protocols
- [x] C# (roslyn)
- [x] Rust (rust-analyzer)
- [x] C (clangd)
- [x] Lua

> What you need to know about Rust's LSP: it updates **only when you save the file**

### And i plan to add LSP configs for HTML and CSS
## Auto completion and snippets
- [x] C#
- [x] Rust
- [x] C
- [x] Lua

## Completion and Snippets Plugins
1. CMP (by hrsh7th) and it's dependencies
2. LuaSnip
    1. A fork by swplayerMC (also me)
    2. I did that because i was having problems cloning the repo
    3. But that is just a clone, with nothing changed
3. Friendly Snippets (offers a lot of additional snippets)

## Visual plugins
1. Tokyonight theme (moon variant)
2. Tree Sitter
3. Lua Line
4. Todo Comments (highlight comments containing specific types of messages)
5. Notify (beautiful notification popups)

## Code time helpers
1. Tiny Inline Diagnostics
2. Trouble
3. Undo Tree (easier access to Neovim's undo history)
4. Auto Pairs
5. 

## File management and fuzzy finding
1. Telescope (essencial one)
2. Harpoon (easy and fast navigation between selected files)
3. Oil (interact with file system within a buffer)

## Git integration (not very good yet)
1. Fugitive (see `git status` inside Neovim)
2. Gitsigns

## Extras
1. Flash (jump into anywhere in the buffer, but very fast)
2. Which Key
3. Persistence (restore last session with one single key map)

