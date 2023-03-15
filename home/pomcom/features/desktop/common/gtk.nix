{ config, pkgs, inputs, ... }:

{
  gtk = {
    enable = true;
    font = {
      name = config.fontProfiles.regular.family;
      size = 12;
    };
    theme = {
      name = "Orchis-Grey-Dark-Compact";
      package = pkgs.orchis-theme;

        
      # name = "Colloid-Dark";
      # package = pkgs.colloid-gtk-theme;

      # name = "Vertex-Dark";
      # package = pkgs.theme-vertex;
    };
    # theme = {
      # name = "Adwaita-Dark";
      # name = "${config.colorscheme.slug}";
      # package = gtkThemeFromScheme { scheme = config.colorscheme; };
    # };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

 qt = {
      enable = true;
      style = {
        package = pkgs.adwaita-qt;
        name = "adwaita-dark";
      };
    };
  services.xsettingsd = {
    enable = true;
    settings = {
      # "Net/ThemeName" = "${gtk.theme.name}";
      # "Net/IconThemeName" = "${gtk.iconTheme.name}";
    };
  };
}
 
