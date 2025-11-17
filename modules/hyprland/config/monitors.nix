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

windowrule = suppressevent maximize, class:.*
windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0

windowrulev2 = float,class:^(org.pulseaudio.pavucontrol|blueman-manager|nm-connection-editor)$
windowrulev2 = size 1200 800,class:^(org.pulseaudio.pavucontrol|blueman-manager|nm-connection-editor)$
windowrulev2 = center,class:^(org.pulseaudio.pavucontrol|blueman-manager|nm-connection-editor)$

'' else ''
################
### MONITORS ###
################
monitor=,preferred,auto,1

##############################
### WINDOWS AND WORKSPACES ###
##############################

windowrule = suppressevent maximize, class:.*
windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0

windowrulev2 = float,class:^(org.pulseaudio.pavucontrol|blueman-manager|nm-connection-editor)$
windowrulev2 = size 1200 800,class:^(org.pulseaudio.pavucontrol|blueman-manager|nm-connection-editor)$
windowrulev2 = center,class:^(org.pulseaudio.pavucontrol|blueman-manager|nm-connection-editor)$

''
