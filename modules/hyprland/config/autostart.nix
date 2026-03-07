{ config }:
let
  isLaptop = config.hyprland.isLaptop or false;
in
''
#################
### AUTOSTART ###
#################
${if isLaptop then "exec-once = caelestia shell" else "exec-once = kitty"}
${if !isLaptop then "exec-once = swaybg -i /home/cedev/Pictures/wall.png -m fill" else ""}

#############################
### ENVIRONMENT VARIABLES ###
#############################

exec-once = dbus-update-activation-environment --systemd --all
exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE
env = XDG_CURRENT_DESKTOP,Hyprland
env = XCURSOR_SIZE,24
env = HYPRCURSOR_SIZE,24

${if !isLaptop then ''exec-once = bash -lc 'for i in {1..50}; do \
  [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ] && \
  [ -S "/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" ] && break; \
  sleep 0.1; \
done; waybar'' else ""}

#####################
### LOOK AND FEEL ###
#####################
general {
    gaps_in = 5
    gaps_out = 10
    border_size = 1
    col.active_border = rgba(ffffffff)
    col.inactive_border = rgba(ffffffff)
    resize_on_border = true
    allow_tearing = false
    layout = dwindle
}

dwindle {
    pseudotile = true
    preserve_split = true
    force_split = 2
}

master {
    new_status = master
}

misc {
    force_default_wallpaper = 0
    disable_hyprland_logo = true
}

#############
### INPUT ###
#############
input {
    kb_layout = fr
    follow_mouse = 1
    sensitivity = 0
    ${if isLaptop then "touchpad {\n        natural_scroll = true\n        disable_while_typing = true\n        tap-to-click = true\n        accel_profile = flat\n    }" else ""}
}

cursor {
  no_hardware_cursors = true
}
''
