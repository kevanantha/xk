{
  inputs,
  username,
}:

system:

let
  system-config = import ../darwin/configuration.nix;
  home-manager-config = import ../home-manager/home.nix;
in
inputs.darwin.lib.darwinSystem {
  inherit system;
  specialArgs = { inherit inputs; };
  modules = [
    {
      services.nix-daemon.enable = true;
      users.users.${username}.home = "/Users/${username}";
    }

    system-config

    inputs.home-manager.darwinModules.home-manager

    {
      # add home-manager settings here
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."${username}" = home-manager-config;
      home-manager.extraSpecialArgs = { inherit inputs; };
    }
  ];
}
