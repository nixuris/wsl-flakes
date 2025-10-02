{
  description = "Personal flake for FX507ZU4";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    serein-cli = {
      url = "github:nixuris/serein-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    serein-cli,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    # Formatter
    formatter.${system} = pkgs.nixfmt-rfc-style;
    # Home Manager
    homeConfigurations."nixuris@serein" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs;};
      modules = [./home/home.nix];
    };
    # Dev Shell
    devShells.${system} = {
      rs = import ./devshells/rs.nix {inherit pkgs;};
      go = import ./devshells/go.nix {inherit pkgs;};
      js = import ./devshells/js.nix {inherit pkgs;};
      py = import ./devshells/py.nix {inherit pkgs;};
    };
  };
}
