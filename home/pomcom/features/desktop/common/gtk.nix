{ config, pkgs, inputs, ... }:

{

  
  home.packages = with pkgs; [
    gtkmm4
    gtkmm3
    gtkmm2
  ];

  gtk = {
    enable = true;
    font = {
      name = config.fontProfiles.regular.family;
      size = 12;
    };
    theme = {
      name = "Orchis-Grey-Dark-Compact";
      package = pkgs.orchis-theme;
    };
        
      # name = "Adwaita-Dark";
      # package = pkgs.colloid-gtk-theme;

      # name = "Colloid-Dark";
       #package = pkgs.colloid-gtk-theme;

      # name = "Vertex-Dark";
      # package = pkgs.theme-vertex;
    
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
    platformTheme = "gtk";
    style = {
      name = "gtk2";
      package = pkgs.libsForQt5.qtstyleplugins;
    };
  };

 
  services.xsettingsd = {
    enable = true;
    settings = {
       "Net/ThemeName" = "Orchis-Grey-Dark-Compact";
       "Net/IconThemeName" = "Papirus";
    };
  };



}
 
