{
  description = "Kevan's Nix on macOS environment.";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/release-24.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    _1password-shell-plugins.url = "github:1Password/shell-plugins";
    _1password-shell-plugins.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self
    , darwin
    , home-manager
    , nixpkgs
    , ...
    } @ inputs:

    let
      darwin-system = import ./system/darwin.nix { inherit inputs username; };
      username = "mekari";
    in
    {
      formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;

      darwinConfigurations = {
        aarch64 = darwin-system "aarch64-darwin";
        x86_64 = darwin-system "x86_64-darwin";
        mekari-macbookpro = darwin-system "x86_64-darwin";
      };
    };
}
