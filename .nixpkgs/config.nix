{pkgs, ...}: {
    allowUnfree = true;

    packageOverrides = pkgs: with pkgs; {
        all = buildEnv {
            name = "all";
            paths = [
            	git
            	nodejs
            	tldr

            	feh
            	compton

                xsel
                xbindkeys
                xdotool

            ];
        };
    };
}