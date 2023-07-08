{ config, pkgs, inputs, ... }:


# {
#   environment.variables = {
# # This will become a global environment variable
#     "QT_STYLE_OVERRIDE"="kvantum";
#   };
# };



{
  home.packages = with pkgs; [
      gtkmm4
      gtkmm3
      gtkmm2
      libsForQt5.qt5ct
  ];

  home.sessionVariables = {
    TERMINAL = "alacritty";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

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

    gtk3.extraConfig= {
      gtk-application-prefer-dark-theme=true;
    };

    gtk4.extraConfig= {
      gtk-application-prefer-dark-theme=true;
    };

  };

  # qt = {
  #   enable = true;
  #   platformTheme = "gtk";
  #   style = {
#package = pkgs.adwaita-qt;
#name = "adwaita-dark";
       # name = "gtk2";
      # package = pkgs.libsForQt5.qtstyleplugins;
    #  package = pkgs.libsForQt5.qtstyleplugin-kvantum;
    #  name = "gtk2";
  #   };
  # };

  services.xsettingsd = {
    enable = true;
    settings = {
      "Net/ThemeName" = "Orchis-Grey-Dark-Compact";
      "Net/IconThemeName" = "Papirus";
    };
  };


}



