{ config, lib, pkgs, ... }:

{
  config = {
    programs.rofi = {
      enable = true;
    };

    xdg.configFile."rofi/config.rasi".text = ''
// Config //
configuration {
    modi:                        "drun,filebrowser,window,run";
    show-icons:                  false;
    display-drun:                 "";
    display-run:                  "";
    display-filebrowser:          "";
    display-window:               "";
    drun-display-format:          "{name}";
    window-format:                "{w}{t}";
    font:                         "JetBrainsMono Nerd Font Mono";
    icon-theme:                   "Tela-circle-dracula";
    terminal:                     "/home/cedev/.nix-profile/bin/kitty";
}

@theme "~/.config/rofi/themes/theme.rasi"


// Main //
window {
    height:                      37em;
    width:                       49em;
    transparency:                "real";
    fullscreen:                  false;
    enabled:                     true;
    cursor:                      "default";
    spacing:                     0em;
    padding:                     0em;
    border-color:                @main-br;
    background-color:            @main-bg;
}
mainbox {
    enabled:                     true;
    spacing:                     0em;
    padding:                     0em;
    orientation:                 vertical;
    children:                    [ "inputbar" , "listbox" ];
    background-color:            transparent;
    //background-image:            url("~/.config/swww/wall.blur", height);
}


// Inputs //
inputbar {
    enabled:                     true;
    spacing:                     10px;
    padding:                     1.2em;
    children:                    [ "textbox-prompt-colon", "entry" ];
    background-color:            @main-bg;
    // background-image:            url("~/.config/swww/wall.rofi", width);
}

textbox-prompt-colon {
    enabled:                     false;
    expand:                      false;
    str:                         "test";
    background-color:            inherit;
    text-color:                  inherit;
}

entry {
    border-radius:               0em;
    border:                      1px;
    border-color:                #EAB2C2;
    enabled:                     true;
    spacing:                     0em;
    padding:                     0.8em;
    text-color:                  #83A3BB;
    //61382D
    background-color:            transparent;
    placeholder:                 "looking for something...?";
    placeholder-color:           #83A3BB;
    cursor:                      text;
}

// Lists //
listbox {
    padding:                     1.15em;
    spacing:                     0em;
    orientation:                 horizontal;
    children:                    [ "listview"];
    background-color:            @main-bg;
}
listview {
    padding:                     0em;
    spacing:                     0em;
    enabled:                     true;
    columns:                     1;
    lines:                       10;
    cycle:                       true;
    dynamic:                     true;
    scrollbar:                   false;
    layout:                      vertical;
    reverse:                     false;
    fixed-height:                true;
    fixed-columns:               true;
    cursor:                      "default";
    background-color:            transparent;
    text-color:                  @main-fg;
}


// Modes //
mode-switcher {
    orientation:                 vertical;
    width:                       1em;
    enabled:                     false;
    padding:                     1.5em;
    spacing:                     1.5em;
    background-color:            transparent;
}
button {
    cursor:                      pointer;
    vertical-align:              0.50;
    horizontal-align:            0.45;
    border-radius:               2em;
    background-color:            @main-bg;
    text-color:                  @main-fg;
}
button selected {
    background-color:            @main-fg;
    text-color:                  @main-bg;
}


// Elements //
element {
    enabled:                     true;
    spacing:                     0em;
    padding:                     0.2em;
    cursor:                      pointer;
    background-color:            transparent;
    text-color:                  #EBDDBC;
}
@media(max-aspect-ratio: 1.8) {
    element {
        orientation:             vertical;
    }
}
element selected.normal {
    background-color:            #EAB2C2;
    text-color:                  #1B1E25;
    border-radius:		 0px;
}
element-icon {
    size:                        2.1em;
    cursor:                      inherit;
    background-color:            transparent;
    text-color:                  inherit;
}
element-text {
    vertical-align:              0.5;
    horizontal-align:            0.0;
    cursor:                      inherit;
    background-color:            transparent;
    text-color:                  inherit;
    padding: 	         	 0.7em;
}
'';

    xdg.configFile."rofi/themes/theme.rasi".text = ''
* {
    font:   "JetBrainsMono Nerd Font, sans-serif";

    nord0:     #2e3440;
    nord1:     #3b4252;
    nord2:     #434c5e;
    nord3:     #4c566a;

    nord4:     #d8dee9;
    nord5:     #e5e9f0;
    nord6:     #eceff4;

    nord7:     #8fbcbb;
    nord8:     #88c0d0;
    nord9:     #81a1c1;
    nord10:    #5e81ac;
    nord11:    #bf616a;

    nord12:    #d08770;
    nord13:    #ebcb8b;
    nord14:    #a3be8c;
    nord15:    #b48ead;

    background-color:   transparent;
    text-color:         @nord4;
    accent-color:       @nord8;

    main-bg:            @nord0;
    main-br:            @accent-color;
    main-fg:            @nord4;

    margin:     0px;
    padding:    0px;
    spacing:    0px;
}

window {
    background-color:   @nord0;
    border-color:       @accent-color;

    location:   center;
    width:      480px;
    border:     1px;
}

inputbar {
    padding:    8px 12px;
    spacing:    12px;
    children:   [ prompt, entry ];
}

prompt, entry, element-text, element-icon {
    vertical-align: 0.5;
}

prompt {
    text-color: @accent-color;
}

listview {
    lines:      8;
    columns:    1;

    fixed-height:   false;
    background-color: transparent;
}

element {
    padding:    8px;
    spacing:    8px;
}

element normal urgent {
    text-color: @nord13;
}

element normal active {
    text-color: @accent-color;
}

element alternate active {
    text-color: @accent-color;
}

element selected {
    text-color: @nord0;
}

element selected normal {
    background-color:   @accent-color;
}

element selected urgent {
    background-color:   @nord13;
}

element selected active {
    background-color:   @nord8;
}

element-icon {
    size:   0.75em;
}

element-text {
    text-color: inherit;
}
'';
  };
}