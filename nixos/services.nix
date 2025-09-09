{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us,ru";
    xkb.options = "grp:ctrl_space_toggle";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
}
