{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    packages."x86_64-linux" = let
      neovimConfigured = inputs.nvf.lib.neovimConfiguration {
        inherit (nixpkgs.legacyPackages."x86_64-linux") pkgs;
        modules = [
          {
            config.vim = {
              viAlias = true;
              vimAlias = true;
              debugMode = {
                enable = false;
                level = 16;
                logFile = "/tmp/nvim.log";
              };

              keymaps = [
                {
                  mode = "n";
                  key = "<leader>pt";
                  action = "<cmd>TypstPreviewToggle<CR>";
                  silent = true;
                  desc = "Toggle Typst Preview";
                }
                {
                  mode = "n";
                  key = "|";
                  action = "<cmd>vsplit<cr>";
                  silent = true;
                  desc = "Vertical split";
                }
                {
                  mode = "n";
                  key = "\\";
                  action = "<cmd>split<cr>";
                  silent = true;
                  desc = "Horizontal split";
                }
                {
                  mode = "n";
                  key = "<C-H>";
                  action = "<C-w>h";
                  silent = true;
                  desc = "Move to left split";
                }
                {
                  mode = "n";
                  key = "<C-J>";
                  action = "<C-w>j";
                  silent = true;
                  desc = "Move to below split";
                }
                {
                  mode = "n";
                  key = "<C-K>";
                  action = "<C-w>k";
                  silent = true;
                  desc = "Move to above split";
                }
                {
                  mode = "n";
                  key = "<C-L>";
                  action = "<C-w>l";
                  silent = true;
                  desc = "Move to right split";
                }
                {
                  mode = "n";
                  key = "<C-Up>";
                  action = "<Cmd>resize -2<CR>";
                  silent = true;
                  desc = "Resize split up";
                }
                {
                  mode = "n";
                  key = "<C-Down>";
                  action = "<Cmd>resize +2<CR>";
                  silent = true;
                  desc = "Resize split down";
                }
                {
                  mode = "n";
                  key = "<C-Left>";
                  action = "<Cmd>vertical resize -2<CR>";
                  silent = true;
                  desc = "Resize split left";
                }
                {
                  mode = "n";
                  key = "<C-Right>";
                  action = "<Cmd>vertical resize +2<CR>";
                  silent = true;
                  desc = "Resize split right";
                }
                {
                  mode = "n";
                  key = "<leader>q";
                  action = "<cmd>confirm q<cr>";
                  desc = "Quit window";
                }
                {
                  mode = "n";
                  key = "<leader>Q";
                  action = "<cmd>confirm qall<cr>";
                  desc = "Exit neovim";
                }
                {
                  mode = "n";
                  key = "<leader>n";
                  action = "<cmd>enew<cr>";
                  desc = "New file";
                }
                {
                  mode = "n";
                  key = "<c-q>";
                  action = "<cmd>q!<cr>";
                  desc = "Force quit";
                }
                {
                  key = "<leader>wq";
                  mode = ["n"];
                  action = ":wq<CR>";
                  silent = true;
                  desc = "Save file and quit";
                }
                {
                  key = "<leader>w";
                  mode = ["n"];
                  action = ":w<CR>";
                  silent = true;
                  desc = "Save file";
                }
                {
                  key = "<leader>e";
                  mode = ["n"];
                  action = ":Neotree toggle<CR>";
                  silent = true;
                  desc = "Toggle Neotree";
                }
                {
                  key = "<leader>o";
                  mode = ["n"];
                  action = ":Neotree focus<CR>";
                  silent = true;
                  desc = "Focus Neotree";
                }
              ];

              spellcheck = {
                enable = true;
              };

              lsp = {
                formatOnSave = true;
                lspkind.enable = false;
                lightbulb.enable = true;
                lspsaga.enable = false;
                trouble.enable = true;
                lspSignature.enable = true;
                otter-nvim.enable = true;
                lsplines.enable = true;
                nvim-docs-view.enable = true;
              };

              debugger = {
                nvim-dap = {
                  enable = true;
                  ui.enable = true;
                };
              };

              # This section does not include a comprehensive list of available language modules.
              # To list all available language module options, please visit the nvf manual.
              languages = {
                enableLSP = true;
                enableFormat = true;
                enableTreesitter = true;
                enableExtraDiagnostics = true;

                # Languages that will be supported in default and maximal configurations.
                nix.enable = true;
                markdown.enable = true;

                # Languages that are enabled in the maximal configuration.
                bash.enable = true;
                clang.enable = true;
                css.enable = true;
                html.enable = true;
                sql.enable = true;
                java.enable = true;
                kotlin.enable = true;
                ts.enable = true;
                go.enable = true;
                lua.enable = true;
                zig.enable = true;
                python.enable = true;
                typst.enable = true;
                rust = {
                  enable = true;
                  crates.enable = true;
                };

                # Language modules that are not as common.
                assembly.enable = false;
                astro.enable = false;
                nu.enable = false;
                csharp.enable = false;
                julia.enable = false;
                vala.enable = false;
                scala.enable = false;
                r.enable = false;
                gleam.enable = false;
                dart.enable = false;
                ocaml.enable = false;
                elixir.enable = false;
                haskell.enable = false;

                tailwind.enable = false;
                svelte.enable = false;

                # Nim LSP is broken on Darwin and therefore
                # should be disabled by default. Users may still enable
                # `vim.languages.vim` to enable it, this does not restrict
                # that.
                # See: <https://github.com/PMunch/nimlsp/issues/178#issue-2128106096>
                nim.enable = false;
              };

              visuals = {
                nvim-scrollbar.enable = true;
                nvim-web-devicons.enable = true;
                nvim-cursorline.enable = true;
                cinnamon-nvim.enable = true;
                fidget-nvim.enable = true;

                highlight-undo.enable = true;
                indent-blankline.enable = true;

                # Fun
                cellular-automaton.enable = false;
              };

              statusline = {
                lualine = {
                  enable = true;
                  theme = "gruvbox";
                };
              };

              theme = {
                enable = true;
                name = "gruvbox";
                style = "dark";
                transparent = false;
              };

              autopairs.nvim-autopairs.enable = true;

              autocomplete.nvim-cmp.enable = true;
              snippets.luasnip.enable = true;

              filetree = {
                neo-tree = {
                  enable = true;
                };
              };

              tabline = {
                nvimBufferline.enable = true;
              };

              treesitter.context.enable = false;

              binds = {
                whichKey.enable = true;
                cheatsheet.enable = true;
              };

              telescope.enable = true;

              git = {
                enable = true;
                gitsigns.enable = true;
                gitsigns.codeActions.enable = false; # throws an annoying debug message
              };

              minimap = {
                minimap-vim.enable = false;
                codewindow.enable = true; # lighter, faster, and uses lua for configuration
              };

              dashboard = {
                dashboard-nvim.enable = false;
                alpha.enable = true;
              };

              notify = {
                nvim-notify.enable = true;
              };

              projects = {
                project-nvim.enable = true;
              };

              utility = {
                ccc.enable = false;
                vim-wakatime.enable = false;
                icon-picker.enable = true;
                surround.enable = true;
                diffview-nvim.enable = true;
                motion = {
                  hop.enable = true;
                  leap.enable = true;
                  precognition.enable = true;
                };

                images = {
                  image-nvim.enable = false;
                };
              };

              notes = {
                todo-comments.enable = true;
              };

              terminal = {
                toggleterm = {
                  enable = true;
                  lazygit.enable = true;
                };
              };

              ui = {
                borders.enable = true;
                noice.enable = true;
                colorizer.enable = true;
                modes-nvim.enable = false; # the theme looks terrible with catppuccin
                illuminate.enable = true;
                breadcrumbs = {
                  enable = true;
                  navbuddy.enable = true;
                };
                smartcolumn = {
                  enable = true;
                  setupOpts.custom_colorcolumn = {
                    # this is a freeform module, it's `buftype = int;` for configuring column position
                    nix = "110";
                    ruby = "120";
                    java = "130";
                    go = ["90" "130"];
                  };
                };
                fastaction.enable = true;
              };

              assistant = {
                chatgpt.enable = false;
                copilot = {
                  enable = false;
                  cmp.enable = true;
                };
              };

              session = {
                nvim-session-manager.enable = false;
              };

              gestures = {
                gesture-nvim.enable = false;
              };

              comments = {
                comment-nvim.enable = true;
              };

              presence = {
                neocord.enable = false;
              };

              extraPlugins = with nixpkgs.legacyPackages."x86_64-linux".vimPlugins; {
                rip-substitute = {
                  package = nvim-rip-substitute;
                  setup = "require('rip-substitute').setup {}";
                };
              };
              extraPackages = with nixpkgs.legacyPackages."x86_64-linux"; [
                fzf
                ripgrep
              ];
            };
          }
        ];
      };
    in {
      # Set the default package to the wrapped instance of Neovim.
      # This will allow running your Neovim configuration with
      # `nix run` and in addition, sharing your configuration with
      # other users in case your repository is public.
      default = neovimConfigured.neovim;
    };
  };
}
