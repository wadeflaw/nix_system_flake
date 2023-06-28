{ pkgs, ... }: {
  sound.enable = true;
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
  };
  environment.systemPackages = with pkgs; [
    bluetuith
  ];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # wireplumber.enable = true;
    # audio.enable = true;
    # systemWide = true;
  };
  security.rtkit.enable = true;
}
