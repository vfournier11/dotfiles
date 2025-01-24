{ config, ... }:

{ 
  # nvidia-smi
  # echo $XDG_SESSION_TYPE

  # nvidiaPackages.beta only works with Gnome xorg
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;

  # 550.127.05 (production as of 2024/12/24)
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;

  # 560.35.03
  # make xorg slow to open.
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
  #   version = "560.35.03";
  #   sha256_64bit = "sha256-8pMskvrdQ8WyNBvkU/xPc/CtcYXCa7ekP73oGuKfH+M=";
  #   sha256_aarch64 = "sha256-s8ZAVKvRNXpjxRYqM3E5oss5FdqW+tv1qQC2pDjfG+s=";
  #   openSha256 = "sha256-/32Zf0dKrofTmPZ3Ratw4vDM7B+OgpC4p7s+RHUjCrg=";
  #   settingsSha256 = "sha256-kQsvDgnxis9ANFmwIwB7HX5MkIAcpEEAHc8IBOLdXvk=";
  #   persistencedSha256 = "sha256-E2J2wYYyRu7Kc3MMZz/8ZIemcZg68rkzvqEwFAL3fFs=";
  # };
}
