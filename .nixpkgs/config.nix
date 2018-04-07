{pkgs, ...}: {
    allowUnfree = true;

    packageOverrides = pkgs: with pkgs; {
        all = buildEnv {
            name = "all";
            paths = [
                git
                tldr
                zip unzip

                ffmpeg
                imagemagick
                # simplescreenrecorder

                feh
                compton

                xsel
                xbindkeys
                xdotool

            ];
        };
    };
}
