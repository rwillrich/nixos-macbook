{ lib, pkgs, ... }: {
  services.displayManager.gdm.enable = true;

  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    epiphany
    yelp
  ];

  environment.systemPackages = with pkgs; [
    # Themes the apps titlebars
    qadwaitadecorations
    qadwaitadecorations-qt6

    # Themes the apps
    qgnomeplatform
    qgnomeplatform-qt6

    # GNOME extensions
    gnomeExtensions.appindicator
  ];

  programs.dconf = {
    enable = true;

    profiles.user.databases = [
      {
        lockAll = true;

        settings = with lib.gvariant; {
          "org/freedesktop/tracker/miner/files" = {
            index-recursive-directories = mkEmptyArray type.string;
          };

          "org/gnome/desktop/input-sources" = {
            mru-sources = [
              [
                "xkb"
                "us"
              ]
            ];
            sources = [
              [
                "xkb"
                "us+altgr-intl"
              ]
            ];
            xkb-options = [
              "terminate:ctrl_alt_bksp"
              "compose:rwin"
            ];
          };

          "org/gnome/desktop/interface" = {
            clock-show-weekday = true;
            color-scheme = "prefer-dark";
            enable-hot-corners = false;
            show-battery-percentage = true;
          };

          "org/gnome/desktop/privacy" = {
            remember-recent-files = false;
          };

          "org/gnome/desktop/screen-time-limits" = {
            daily-limit-enabled = false;
            history-enabled = false;
          };

          "org/gnome/desktop/sound" = {
            event-sounds = false;
          };

          "org/gnome/GWeather4" = {
            temperature-unit = "centigrade";
          };

          "org/gnome/mutter" = {
            edge-tiling = false;
            experimental-features = [ "autoclose-xwayland" ];
          };

          "org/gnome/nautilus/preferences" = {
            show-create-link = true;
            show-delete-permanently = true;
          };

          "org/gnome/desktop/search-providers" = {
            disable-external = true;
          };

          "org/gnome/settings-daemon/plugins/power" = {
            power-button-action = "suspend";
          };

          "org/gnome/shell" = {
            enabled-extensions = with pkgs.gnomeExtensions; [ appindicator.extensionUuid ];

            favorite-apps = [
              "firefox.desktop"
              "org.gnome.Console.desktop"
              "codium.desktop"
              "org.gnome.Nautilus.desktop"
              "org.gnome.Settings.desktop"
            ];
          };

          "org/gnome/system/location" = {
            enabled = true;
          };

          "org/gtk/gtk4/settings/file-chooser" = {
            show-hidden = true;
          };

          "system/locale" = {
            region = "pt_BR.UTF-8";
          };
        };
      }
    ];
  };
}
