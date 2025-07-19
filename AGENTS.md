# AGENTS.md - nvf-config

## Build/Test Commands
- `nix run` - Build and run the configured Neovim
- `nix build` - Build the Neovim configuration package
- `nix flake check` - Validate flake configuration
- No traditional test suite - configuration is validated through Nix evaluation

## Project Structure
This is a Neovim configuration using the nvf (Neovim Flake) framework with Nix flakes.
- `flake.nix` - Main flake configuration defining inputs and outputs
- `config/` - Neovim configuration modules
- `config/default.nix` - Main configuration entry point importing all modules

## Code Style Guidelines

### Nix Files (.nix)
- Use 2-space indentation (consistent with existing files)
- Follow attribute set formatting: `{config, ...}: {`
- Use descriptive comments for complex configurations
- Group related settings logically (e.g., all LSP settings together)
- Boolean values: use `true`/`false`, not strings

### Lua Files (.lua)
- Use `VIM` global instead of `vim` for consistency
- 2-space indentation for nested structures
- Use descriptive variable names and comments for complex logic
- Prefer autocmd groups for organization: `nvim_create_augroup`

### Configuration Patterns
- Enable modules explicitly: `enable = true;`
- Use setupOpts for plugin-specific configuration
- Disable unused features explicitly for clarity: `enable = false;`