{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      editorconfig.editorconfig
      bbenoist.nix
      tamasfe.even-better-toml
      redhat.vscode-yaml
    ];
  };
}
