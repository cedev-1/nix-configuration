{ config }:

if config.hyprland.isDualMonitor then ''
################
### MONITORS ###
################
monitor=HDMI-A-1,1920x1080@60,0x0,1
monitor=HDMI-A-2,1920x1080@60,1920x0,1

# Association workspaces/écrans
workspace = 1, monitor:HDMI-A-1
workspace = 3, monitor:HDMI-A-1
workspace = 5, monitor:HDMI-A-1
workspace = 7, monitor:HDMI-A-1
workspace = 9, monitor:HDMI-A-1
workspace = 2, monitor:HDMI-A-2
workspace = 4, monitor:HDMI-A-2
workspace = 6, monitor:HDMI-A-2
workspace = 8, monitor:HDMI-A-2
workspace = 10, monitor:HDMI-A-2

##############################
### WINDOWS AND WORKSPACES ###
##############################

windowrule = suppress_event maximize, match:class .*
windowrule = no_initial_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0

windowrule = float on, match:class ^(org.pulseaudio.pavucontrol|blueman-manager|nm-connection-editor)$
windowrule = size 1200 800, match:class ^(org.pulseaudio.pavucontrol|blueman-manager|nm-connection-editor)$

'' else ''
################
### MONITORS ###
################
monitor=,preferred,auto,1

##############################
### WINDOWS AND WORKSPACES ###
##############################

windowrule = suppress_event maximize, match:class .*
windowrule = no_initial_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0

windowrule = float on, match:class ^(org.pulseaudio.pavucontrol|blueman-manager|nm-connection-editor)$
windowrule = size 1200 800, match:class ^(org.pulseaudio.pavucontrol|blueman-manager|nm-connection-editor)$

''
