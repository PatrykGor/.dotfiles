{ config, pkgs, ... }:
let
  zscroll = "${pkgs.zscroll}/bin/zscroll";
  getSpotifyStatus = pkgs.callPackage ./get_spotify_status.nix {};
in
pkgs.writeShellScriptBin "scroll_spotify_status.sh" ''
# see man zscroll for documentation of the following parameters
${zscroll} -l 30 \
        --delay 0.1 \
        --scrollpadding "  " \
        --matchcommand "${getSpotifyStatus}/bin/get_spotify_status.sh --status" \
        --matchtext "Playing" --scroll 1 \
        --matchtext "Paused" --scroll 0 \
        --updatecheck "${getSpotifyStatus}/bin/get_spotify_status.sh" &
wait
''

