{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    # 其他 inputs...
  };
  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.your-hostname = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # 已有的其他模块...
        ({ pkgs, ... }: {
          boot.kernelPackages = pkgs.linuxPackages_zen;
          # 如果有 NVIDIA 闭源驱动：
          hardware.nvidia.open = false;
          services.xserver.videoDrivers = [ "nvidia" ];
        })
      ];
    };
  };
}