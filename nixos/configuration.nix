# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hardware-nvidia-560.nix
  ];

  # Bootloader.
  boot = {
    kernelParams = [
      "acpi_enforce_resources=lax"
    ];
    kernelModules = [
      "i2c-dev" "i2c-piix4"
    ];
    supportedFilesystems = ["ntfs"];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
      };
    };
  };

  time.hardwareClockInLocalTime = true;
  #boot.loader.grub.useOSProber = true;

  #boot.loader.systemd-boot.enable = true;

  networking.hostName = "erebus"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  i18n.defaultLocale = "en_CA.UTF-8";
  # espanol
  # i18n = {
  #   defaultLocale = "es_ES.UTF-8";
  #   supportedLocales = [ "es_ES.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  #};
  # after the update run:
  #   rm ~/.config/user-dirs.dirs
  #   rm ~/.config/user-dirs.locale

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  # programs.sway.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # xfce desktop manager
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;
  # services.xserver.desktopManager.mate.enable = true;
  # services.desktopManager.lxqt.enable = true;
  # required for Flatpaks
  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  
  # KDE
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # https://nixos.wiki/wiki/Nvidia
  # ---------------------------------------- 
  # Enable OpenGL
  hardware.graphics.enable = true;

  # old option
  # hardware.opengl = {
    # enable = true;
    # driSupport = true;  
    # driSupport32Bit = true;
  # };

  # services.xserver.videoDrivers = ["modesetting" "fbdev"]; # Default videoDrivers
  services.xserver.videoDrivers = ["nvidia"]; # Load nvidia driver for Xorg and Wayland

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the Nvidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = false;
  };

  # ---------------------------------------- 
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
    };
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vfournier11 = {
    isNormalUser = true;
    description = "Vincent Fournier";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  programs.steam.enable = true;

  programs.direnv.enable = true;

  # https://gitlab.com/coolercontrol/coolercontrol
  # make H150i Elite Capellix blink
  # programs.coolercontrol.enable = true;
  # programs.coolercontrol.nvidiaSupport = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  virtualisation.docker.enable = true;
  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-27.3.11"
  # ];

  #fonts.packages = with pkgs; [ 
  #  (nerdfonts.override { fonts = [ "IosevkaTerm" ]; })
  #];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #pkgs.godot_4
    #pkgs.libvlc
    #pkgs.neovim
    #pkgs.obsidian
    #pkgs.vlc
    pkgs.nvtop
    pkgs.stow
    pkgs.audacity
    pkgs.bitwarden-desktop
    pkgs.brave
    pkgs.devenv
    pkgs.docker-compose
    pkgs.eza
    pkgs.fish
    pkgs.gimp
    pkgs.git
    pkgs.gparted
    pkgs.htop
    pkgs.nix-tree
    pkgs.neovim
    pkgs.libgcc
    pkgs.nodejs_22
    pkgs.unzip
    pkgs.ripgrep
    pkgs.obsidian
    pkgs.openrgb-with-all-plugins
    pkgs.qbittorrent-enhanced
    pkgs.starship
    pkgs.strawberry
    pkgs.tmux
    pkgs.translate-shell
    pkgs.lua-language-server
    pkgs.vim
    pkgs.wezterm
    pkgs.xclip
    # pkgs.logseq
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  # pkgs.liquidctl
  ];

  services.udev.packages = with pkgs; [ openrgb-with-all-plugins ];

  services.flatpak.enable = true;

  services.plex.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # https://nixos.wiki/wiki/Filesystems
  fileSystems."/mnt/WD80EFAX" = { 
    device = "/dev/disk/by-uuid/2965B5C1278BAE4A";
    fsType = "ntfs";
    options = [ # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "users"
      "nofail"
      "x-gvfs-show"
    ];
  };

  nix.extraOptions = ''
    trusted-users = root vfournier11
  '';
}
