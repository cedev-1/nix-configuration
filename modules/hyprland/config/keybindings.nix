''
###################
### KEYBINDINGS ###
###################
$mainMod = SUPER
$terminal = kitty
# $fileManager = kitty -e ranger
$fileManager = kitty -e ranger
$menu = rofi -show drun

bind = $mainMod, Q, exec, $terminal
bind = $mainMod, C, killactive,
bind = $mainMod, M, exit,
bind = $mainMod, E, exec, $fileManager
bind = $mainMod, V, togglefloating,
bind = $mainMod, R, exec, $menu
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, O, togglesplit, # dwindle

bind = , Print, exec, grim -g "$(slurp -d)" - | wl-copy
bind = SUPER, T, exec, kitty -e btop
bind = SUPER, F, exec, firefox
bind = SUPER, G, exec, code
bind = SUPER, J, exec, kitty -e jellyfin-tui
bind = SUPER, K, exec, kitty -e k9s

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, ampersand, workspace, 1
bind = $mainMod, eacute, workspace, 2
bind = $mainMod, quotedbl, workspace, 3
bind = $mainMod, apostrophe, workspace, 4
bind = $mainMod, parenleft, workspace, 5
bind = $mainMod, minus, workspace, 6
bind = $mainMod, egrave, workspace, 7
bind = $mainMod, underscore, workspace, 8
bind = $mainMod, ccedilla, workspace, 9
bind = $mainMod, agrave, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, ampersand, movetoworkspace, 1
bind = $mainMod SHIFT, eacute, movetoworkspace, 2
bind = $mainMod SHIFT, quotedbl, movetoworkspace, 3
bind = $mainMod SHIFT, apostrophe, movetoworkspace, 4
bind = $mainMod SHIFT, parenleft, movetoworkspace, 5
bind = $mainMod SHIFT, minus, movetoworkspace, 6
bind = $mainMod SHIFT, egrave, movetoworkspace, 7
bind = $mainMod SHIFT, underscore, movetoworkspace, 8
bind = $mainMod SHIFT, ccedilla, movetoworkspace, 9
bind = $mainMod SHIFT, agrave, movetoworkspace, 10

# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic
bind = $mainMod, F11, fullscreen, 1

# Déplacer la fenêtre flottante au clavier
bind = $mainMod CTRL, left,  moveactive, -50 0
bind = $mainMod CTRL, right, moveactive,  50 0
bind = $mainMod CTRL, up,    moveactive,  0 -50
bind = $mainMod CTRL, down,  moveactive,  0  50

# Redimensionner la fenêtre flottante au clavier
bind = $mainMod CTRL SHIFT, left,  resizeactive, -50 0
bind = $mainMod CTRL SHIFT, right, resizeactive,  50 0
bind = $mainMod CTRL SHIFT, up,    resizeactive,  0 -50
bind = $mainMod CTRL SHIFT, down,  resizeactive,  0  50

# Alignements rapides sur les bords (utile pour “doker” une flottante)
bind = $mainMod ALT, left,  movewindoworgroup, l
bind = $mainMod ALT, right, movewindoworgroup, r
bind = $mainMod ALT, up,    movewindoworgroup, u
bind = $mainMod ALT, down,  movewindoworgroup, d


bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

bindl = , XF86AudioNext, exec, playerctl next
bindl = , XF86AudioPause, exec, playerctl play-pause
bindl = , XF86AudioPlay, exec, playerctl play-pause
bindl = , XF86AudioPrev, exec, playerctl previous

''
