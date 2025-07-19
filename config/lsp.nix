{config, ...}: {
  config.vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      lspkind.enable = false;
      lightbulb.enable = true;
      lspsaga.enable = false;
      trouble.enable = true;
      lspSignature.enable = true;
      otter-nvim.enable = true;
      # lsplines.enable = true;
      nvim-docs-view.enable = true;
    };
    # vim.diagnostics.config

    # This section does not include a comprehensive list of available language modules.
    # To list all available language module options, please visit the nvf manual.
    languages = {
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
      python = {
        enable = true;
        lsp.server = "pyright";
      };
      typst = {
        enable = true;
        format = {
          enable = true;
          type = "typstyle";
        };
      };
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

    treesitter.context.enable = false;
  };
}
