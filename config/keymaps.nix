{config, ...}: {
  config.vim = {
    keymaps = [
      # Stay in indent mode
      # https://github.com/AstroNvim/AstroNvim/blob/v4.7.7/lua/astronvim/plugins/_astrocore_mappings.lua#L117-L118
      {
        mode = "v";
        key = "<S-Tab>";
        action = "<gv";
        silent = true;
        desc = "Unindent line";
      }
      {
        mode = "v";
        key = "<Tab>";
        action = ">gv";
        silent = true;
        desc = "Indent line";
      }
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
      {
        key = "<Esc>";
        mode = ["n"];
        action = "<cmd>nohlsearch<CR>";
        silent = true;
        desc = "clear highlighted search results";
      }
    ];
  };
}
