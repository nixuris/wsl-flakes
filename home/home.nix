{
  config,
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "nixuris";
    homeDirectory = "/home/nixuris";
    stateVersion = "25.11";
    packages = [
      #inputs.serein-cli.packages.${pkgs.system}.stable
      inputs.serein-cli.packages.${pkgs.system}.test
    ];
  };
  imports = [
    ./apps/vcs.nix
    ./apps/fish.nix
    ./apps/fastfetch.nix
    ./apps/nvim.nix
    ./apps/yazi.nix
    ./apps/tmux.nix
    #./apps/ollama.nix
    ./apps/misc.nix
  ];
}
