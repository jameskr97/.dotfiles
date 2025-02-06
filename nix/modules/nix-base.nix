{ nixpkgs, self, ... }: {
    # Necessary for using flakes on this system
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 5;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
}