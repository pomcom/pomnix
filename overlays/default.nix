{ inputs, outputs, ... }:

{
  # custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  neovim-nightly = inputs.neovim-nightly-overlay.overlay;

  alacritty-theme = inputs.alacritty-theme.overlays.default;

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

     vmware-workstation = prev.vmware-workstation.overrideAttrs (old: {
	src = final.fetchurl {
	url = "https://github.com/kulczwoj/vmware-workstation/releases/download/v${builtins.head (final.lib.splitString "." old.version)}.0/VMware-Workstation-Full-${old.version}-${old.build}.x86_64.bundle";
	sha256 = "sha256-qmC3zvKoes77z3x6UkLHsJ17kQrL1a/rxe9mF+UMdJY=";
	};
	unpackPhase = let
	vmware-unpack-env = final.buildFHSEnv {
	name = "vmware-unpack-env";
	targetPkgs = pkgs: [ final.zlib ];
	};
	in ''
	${vmware-unpack-env}/bin/vmware-unpack-env -c "sh ${old.src} --extract unpacked"
	'';
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

