# AGENTS.md - Neovim Configuration Guidelines

## Overview
Personal Neovim config using Lazy.nvim with Lua, Go, SQL, JSON, YAML, GraphQL, Markdown, Bash, Docker, Protobuf, XML, HTML, TOML support.

## Build/Lint/Test Commands
```bash
lua -l lua/core/options.lua                    # Lint single Lua file
stylua lua/                                    # Format all Lua files (also auto-formats on save)
nvim --headless -c "qa!" init.lua             # Verify config loads without errors
```

## Code Style Guidelines

### Formatting
- **Lua formatter**: `stylua` (auto-formats on save via conform.nvim)
- **Line length**: 120 chars (set in `lua/core/options.lua:7`)
- **Indentation**: Tabs (Neovim default)

### Imports & Modules
- Use `safeRequire()` wrapper (init.lua:2-8) for safe module loading with error handling
- Pattern: `require("core.module")` or `require("plugins.module")`
- Modules return plugin specs or config tables

### Naming & Structure
- **Functions**: snake_case (`safeRequire`, `map()`)
- **Variables**: snake_case
- **Constants**: CamelCase in config tables
- **Comments**: Russian/English bilingual (see `autocmds.lua`, `mappings.lua`)

### Error Handling
- Wrap `require()` in `pcall()` for graceful fallbacks (init.lua:3)
- Use `vim.notify()` for user-facing errors
- Silent keymaps by default: `opts.silent = opts.silent ~= false` (mappings.lua:43)

### Plugin Patterns
- Each plugin: separate file in `lua/plugins/`
- Return config tables with `opts`, `cmd`, `event`, `dependencies`
- Formatters in `conform.lua`: stylua (Lua), prettier, jq, gofumpt, pg_format
- LSP servers managed by mason in `plugins/mason.lua`
- Keymaps: use `map()` helper, include `desc` field for documentation
