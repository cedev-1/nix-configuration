{ lib, config, pkgs, ... }:


let
    rangerConfig = {
        rcConf = ./config/rc.conf;
        rifleConf = ./config/rifle.conf;
    };
in {
    options.ranger = {
        enable = lib.mkEnableOption "Enable Ranger file manager";
    };

    config = lib.mkMerge [
        {
            ranger.enable = true;
        }
        (lib.mkIf config.ranger.enable {
            home.file.".config/ranger/rc.conf".source = rangerConfig.rcConf;
            home.file.".config/ranger/rifle.conf".source = rangerConfig.rifleConf;
            
            home.packages = with pkgs; [
                ranger
                ffmpegthumbnailer
                poppler-utils
            ];
        })
    ];
}
