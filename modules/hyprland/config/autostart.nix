''
#################
### AUTOSTART ###
#################
exec-once = kitty
exec-once = swaybg -i /home/cedev/Pictures/wall.png -m fill

#############################
### ENVIRONMENT VARIABLES ###
#############################

exec-once = dbus-update-activation-environment --systemd --all
exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE
env = XDG_CURRENT_DESKTOP,Hyprland
env = XCURSOR_SIZE,24
env = HYPRCURSOR_SIZE,24

exec-once = bash -lc 'for i in {1..50}; do \
  [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ] && \
  [ -S "/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" ] && break; \
  sleep 0.1; \
done; waybar'

#####################
### LOOK AND FEEL ###
#####################
general {
    gaps_in = 5
    gaps_out = 20

    border_size = 1

    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    # Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
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

#####################
### LOOK AND FEEL ###
#####################
general {
    gaps_in = 5
    gaps_out = 20

    border_size = 1

    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    # Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
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
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    sensitivity = 0

    #touchpad {
    #    natural_scroll = false
    #}
}

device {
    name = epic-mouse-v1
    sensitivity = -0.5
}

cursor {
  no_hardware_cursors = true
}
''
