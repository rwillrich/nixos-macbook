{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./disko-configuration.nix
    ./modules/hardware/cpu/intel/ivy-bridge
    ./modules/hardware/network/broadcom/bcm43xx
    ./modules/hardware/pc/ssd
    ./modules/hardware/webcam/apple/facetimehd
    ./modules/nixpkgs-exceptions.nix
    ./modules/users/immutable.nix
    ./modules/users/rwillrich.nix
    ./modules/gnome.nix
    ./modules/firefox.nix
    ./modules/1password.nix
    ./modules/vim.nix
    ./modules/vscodium.nix
    ./modules/mbpfan.nix
    ./specialisations/next
  ];

  nix.channel.enable = false;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  networking.hostName = "aether";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocales = [ "pt_BR.UTF-8/UTF-8" ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  environment.systemPackages = with pkgs; [
    tree
    dmidecode
    lshw
    pciutils
    usbutils
  ];

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  programs.bash = {
    enable = true;
    completion.enable = true;
    vteIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    settings.global = {
      disable_stdenv = true;
      strict_env = true;
      warn_timeout = "10s";
    };
  };

  programs.git = {
    enable = true;

    config = {
      init.defaultBranch = "main";

      user = {
        name = "Rodrigo Willrich";
        email = "rodrigo.willrich@hotmail.com";
      };
    };
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "26.11";
}
