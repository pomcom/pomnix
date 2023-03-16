{ inputs, outputs, ... }:

{
# custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {

    flameshot = prev.flameshot.overrideAttrs (old: {
        src = final.fetchFromGitHub {
        owner = "flameshot-org";
        repo = "flameshot";
        rev = "3ededae";
        hash = "sha256-4SMg63MndCctpfoOX3OQ1vPoLP/90l/KGLifyUzYD5g=";
        };
        cmakeFlags = [ "-DUSE_WAYLAND_GRIM=true" ];
        });

# my-vmware-workstation = prev.vmware-workstation.overrideAttrs (old: {
#   version = "16.2.3";
# });
#

# example = prev.example.overrideAttrs (oldAttrs: rec {
# ...
# });
  };
}

