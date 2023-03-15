{ inputs, outputs, ... }:

{
  # custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {

        my-vmware-workstation = prev.vmware-workstation.overrideAttrs (old: {
          version = "16.2.3";
        });


    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  };
}

