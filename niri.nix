# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    niri.url = "github:sodiboo/niri-flake";
  };

  outputs = { self, nixpkgs, home-manager, niri, ... }: {
    nixosConfigurations.my-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager
        {
          programs.niri.enable = true;       # 系统级安装
          users.users.my-user = {
            isNormalUser = true;
            initialPassword = "changeme";
          };
          home-manager.users.my-user = {     # 用户级配置
            imports = [ niri.homeModules.niri ];
            programs.niri.settings = {
              # ... 你的配置
            };
          };
        }
      ];
    };
  };
}