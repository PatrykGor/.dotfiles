{ config, pkgs, lib, ... }:
with lib;

{
  config = {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        #Browser:
        "text/html" = "org.qutebrowser.qutebrowser.desktop";

        #Multimedia:
        "audio/*" = "mpv.desktop";
        "video/*" = "mpv.desktop";
        "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
        "image/*" = "sxiv.desktop";
      };
    };
  };
}
