{ pkgs, ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;

    package = (pkgs.vim.override { }).customize {
      name = "vim";

      vimrcConfig = {
        packages.myPlugins = with pkgs.vimPlugins; {
          start = [ vim-sensible ];
          opt = [ ];
        };

        customRC = ''
          set expandtab
          set shiftwidth=2
          set tabstop=2
          set softtabstop=2
          set smartindent

          set number
          set scrolloff=3
          set nowrap
          set colorcolumn=80

          set ignorecase
          set smartcase
          set hlsearch
          set showmatch

          set modelines=0

          set wildmode=list:longest
        '';
      };
    };
  };
}
