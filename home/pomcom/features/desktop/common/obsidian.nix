{ pkgs, lib, ... }: {
  home.packages = with pkgs; [ obsidian ];

  # nixpkgs.config.permittedInsecurePackages = [
  #   lib.optional
  #   (pkgs.obsidian.version == "0.4.16")
  #   "electron-25.9.0"
  # ];
}
