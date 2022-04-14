{ config, pkgs, lib, ... }:
with lib;

let
  colorCfg = config.patryk.colors;
in
{
  config = {
    programs.qutebrowser = {
      enable = true;
      keyBindings = {
        normal = {
          "J" = "tab-prev";
          "K" = "tab-next";
        };
      };
      quickmarks = {
        bitbucket = "https://bitbucket.org/dashboard/overview";
      };
      searchEngines = {
        w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
        aw = "https://wiki.archlinux.org/?search={}";
        nw = "https://nixos.wiki/index.php?search={}";
        g = "https://www.google.com/search?hl=en&q={}";
        np = "https://search.nixos.org/packages?channel=21.11&from=0&size=50&sort=relevance&type=packages&query={}";
        no = "https://search.nixos.org/options?channel=21.11&from=0&size=50&sort=relevance&type=packages&query={}";
      };
      settings = {
        colors.webpage.darkmode.enabled = true;
        colors.webpage.darkmode.policy.images = "never";
      };

      #Color Theme:
      extraConfig = ''
        # Background color of the completion widget category headers.
        c.colors.completion.category.bg = "${colorCfg.bg}"

        # Bottom border color of the completion widget category headers.
        c.colors.completion.category.border.bottom = "${colorCfg.primary}"

        # Top border color of the completion widget category headers.
        c.colors.completion.category.border.top = "${colorCfg.primary}"

        # Foreground color of completion widget category headers.
        c.colors.completion.category.fg = "${colorCfg.fg}"

        # Background color of the completion widget for even rows.
        c.colors.completion.even.bg = "${colorCfg.bg}"

        # Background color of the completion widget for odd rows.
        c.colors.completion.odd.bg = "${colorCfg.normal.black}"

        # Text color of the completion widget.
        c.colors.completion.fg = "${colorCfg.fg}"

        # Background color of the selected completion item.
        c.colors.completion.item.selected.bg = "${colorCfg.bright.black}"

        # Bottom border color of the selected completion item.
        c.colors.completion.item.selected.border.bottom = "${colorCfg.bright.black}"

        # Top border color of the completion widget category headers.
        c.colors.completion.item.selected.border.top = "${colorCfg.bright.black}"

        # Foreground color of the selected completion item.
        c.colors.completion.item.selected.fg = "${colorCfg.fg}"

        # Foreground color of the matched text in the completion.
        c.colors.completion.match.fg = "${colorCfg.normal.yellow}"

        # Color of the scrollbar in completion view
        c.colors.completion.scrollbar.bg = "${colorCfg.bg}"

        # Color of the scrollbar handle in completion view.
        c.colors.completion.scrollbar.fg = "${colorCfg.fg}"

        # Background color for the download bar.
        c.colors.downloads.bar.bg = "${colorCfg.bg}"

        # Background color for downloads with errors.
        c.colors.downloads.error.bg = "${colorCfg.bg}"

        # Foreground color for downloads with errors.
        c.colors.downloads.error.fg = "${colorCfg.normal.red}"

        # Color gradient stop for download backgrounds.
        c.colors.downloads.stop.bg = "${colorCfg.bg}"

        # Color gradient interpolation system for download backgrounds.
        ## Type: ColorSystem
        # Valid values:
        # - rgb: Interpolate in the RGB color system.
        # - hsv: Interpolate in the HSV color system.
        # - hsl: Interpolate in the HSL color system.
        # - none: Don't show a gradient.
        c.colors.downloads.system.bg = 'none'

        # Background color for hints. Note that you can use a `rgba(...)` value
        # for transparency.
        c.colors.hints.bg = "${colorCfg.bg}"

        # Font color for hints.
        c.colors.hints.fg = "${colorCfg.bright.black}"

        # Hints
        c.hints.border = '1px solid ' + "${colorCfg.normal.black}"

        # Font color for the matched part of hints.
        c.colors.hints.match.fg = "${colorCfg.normal.white}"

        # Background color of the keyhint widget.
        c.colors.keyhint.bg = "${colorCfg.bg}"

        # Text color for the keyhint widget.
        c.colors.keyhint.fg = "${colorCfg.normal.magenta}"

        # Highlight color for keys to complete the current keychain.
        c.colors.keyhint.suffix.fg = "${colorCfg.bright.black}"

        # Background color of an error message.
        c.colors.messages.error.bg = "${colorCfg.bg}"

        # Border color of an error message.
        c.colors.messages.error.border = "${colorCfg.normal.black}"

        # Foreground color of an error message.
        c.colors.messages.error.fg = "${colorCfg.normal.red}"

        # Background color of an info message.
        c.colors.messages.info.bg = "${colorCfg.bg}"

        # Border color of an info message.
        c.colors.messages.info.border = "${colorCfg.normal.black}"

        # Foreground color an info message.
        c.colors.messages.info.fg = "${colorCfg.normal.blue}"

        # Background color of a warning message.
        c.colors.messages.warning.bg = "${colorCfg.bg}"

        # Border color of a warning message.
        c.colors.messages.warning.border = "${colorCfg.normal.black}"

        # Foreground color a warning message.
        c.colors.messages.warning.fg = "${colorCfg.normal.red}"

        # Background color for prompts.
        c.colors.prompts.bg = "${colorCfg.bg}"

        # ## Border used around UI elements in prompts.
        c.colors.prompts.border = '1px solid ' + "${colorCfg.normal.black}"

        # Foreground color for prompts.
        c.colors.prompts.fg = "${colorCfg.normal.cyan}"

        # Background color for the selected item in filename prompts.
        c.colors.prompts.selected.bg = "${colorCfg.bright.black}"

        # Background color of the statusbar in caret mode.
        c.colors.statusbar.caret.bg = "${colorCfg.bg}"

        # Foreground color of the statusbar in caret mode.
        c.colors.statusbar.caret.fg = "${colorCfg.normal.yellow}"

        # Background color of the statusbar in caret mode with a selection.
        c.colors.statusbar.caret.selection.bg = "${colorCfg.bg}"

        # Foreground color of the statusbar in caret mode with a selection.
        c.colors.statusbar.caret.selection.fg = "${colorCfg.normal.yellow}"

        # Background color of the statusbar in command mode.
        c.colors.statusbar.command.bg = "${colorCfg.bg}"

        # Foreground color of the statusbar in command mode.
        c.colors.statusbar.command.fg = "${colorCfg.bright.magenta}"

        # Background color of the statusbar in private browsing + command mode.
        c.colors.statusbar.command.private.bg = "${colorCfg.bg}"

        # Foreground color of the statusbar in private browsing + command mode.
        c.colors.statusbar.command.private.fg = "${colorCfg.normal.white}"

        # Background color of the statusbar in insert mode.
        c.colors.statusbar.insert.bg = "${colorCfg.primary}"

        # Foreground color of the statusbar in insert mode.
        c.colors.statusbar.insert.fg = "${colorCfg.bright.white}"

        # Background color of the statusbar.
        c.colors.statusbar.normal.bg = "${colorCfg.bg}"

        # Foreground color of the statusbar.
        c.colors.statusbar.normal.fg = "${colorCfg.fg}"

        # Background color of the statusbar in passthrough mode.
        c.colors.statusbar.passthrough.bg = "${colorCfg.bg}"

        # Foreground color of the statusbar in passthrough mode.
        c.colors.statusbar.passthrough.fg = "${colorCfg.normal.yellow}"

        # Background color of the statusbar in private browsing mode.
        c.colors.statusbar.private.bg = "${colorCfg.normal.black}"

        # Foreground color of the statusbar in private browsing mode.
        c.colors.statusbar.private.fg = "${colorCfg.normal.white}"

        # Background color of the progress bar.
        c.colors.statusbar.progress.bg = "${colorCfg.bg}"

        # Foreground color of the URL in the statusbar on error.
        c.colors.statusbar.url.error.fg = "${colorCfg.normal.red}"

        # Default foreground color of the URL in the statusbar.
        c.colors.statusbar.url.fg = "${colorCfg.fg}"

        # Foreground color of the URL in the statusbar for hovered links.
        c.colors.statusbar.url.hover.fg = "${colorCfg.normal.cyan}"

        # Foreground color of the URL in the statusbar on successful load
        c.colors.statusbar.url.success.http.fg = "${colorCfg.normal.green}"

        # Foreground color of the URL in the statusbar on successful load
        c.colors.statusbar.url.success.https.fg = "${colorCfg.normal.green}"

        # Foreground color of the URL in the statusbar when there's a warning.
        c.colors.statusbar.url.warn.fg = "${colorCfg.normal.yellow}"

        # Background color of the tab bar.
        ## Type: QtColor
        c.colors.tabs.bar.bg = "${colorCfg.bright.black}"

        # Background color of unselected even tabs.
        ## Type: QtColor
        c.colors.tabs.even.bg = "${colorCfg.bright.black}"

        # Foreground color of unselected even tabs.
        ## Type: QtColor
        c.colors.tabs.even.fg = "${colorCfg.fg}"

        # Color for the tab indicator on errors.
        ## Type: QtColor
        c.colors.tabs.indicator.error = "${colorCfg.normal.red}"

        # Color gradient start for the tab indicator.
        ## Type: QtColor
        c.colors.tabs.indicator.start = "${colorCfg.normal.yellow}"

        # Color gradient end for the tab indicator.
        ## Type: QtColor
        c.colors.tabs.indicator.stop = "${colorCfg.normal.green}"

        # Color gradient interpolation system for the tab indicator.
        ## Type: ColorSystem
        # Valid values:
        # - rgb: Interpolate in the RGB color system.
        # - hsv: Interpolate in the HSV color system.
        # - hsl: Interpolate in the HSL color system.
        # - none: Don't show a gradient.
        c.colors.tabs.indicator.system = 'none'

        # Background color of unselected odd tabs.
        ## Type: QtColor
        c.colors.tabs.odd.bg = "${colorCfg.bg}"

        # Foreground color of unselected odd tabs.
        ## Type: QtColor
        c.colors.tabs.odd.fg = "${colorCfg.fg}"

        c.colors.tabs.even.bg = "${colorCfg.bg}"

        # Foreground color of unselected even tabs.
        ## Type: QtColor
        c.colors.tabs.even.fg = "${colorCfg.fg}"

        # ## Background color of selected even tabs.
        # ## Type: QtColor
        c.colors.tabs.selected.even.bg = "${colorCfg.fg}"

        # ## Foreground color of selected even tabs.
        # ## Type: QtColor
        c.colors.tabs.selected.even.fg = "${colorCfg.bg}"

        # ## Background color of selected odd tabs.
        # ## Type: QtColor
        c.colors.tabs.selected.odd.bg = "${colorCfg.fg}"

        # ## Foreground color of selected odd tabs.
        # ## Type: QtColor
        c.colors.tabs.selected.odd.fg = "${colorCfg.bg}"

        # Tab padding
        c.tabs.indicator.width = 1
        c.tabs.favicons.scale = 1

      '';
    };
  };
}
