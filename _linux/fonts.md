---
title: change the default font
---

[Debian](https://wiki.debian.org/Fonts)

## default font for a language

[Worked Ref](https://askubuntu.com/questions/597342/change-default-font-for-a-specific-language)

```bash
# check the default font of a language
LANG=fa_IR fc-match

# customize font for specific language
cat > .fonts.conf <<EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match>
    <test name="lang" compare="contains">
      <string>LANGUAGE_CODE</string>
    </test>
    <edit name="family" mode="prepend" binding="strong">
      <string>FONT_NAME</string>
    </edit>
  </match>
</fontconfig>
EOF

```

## add a new font

- download font
- put font in `/usr/local/share/fonts` for system-wide, and in `~/.local/share/fonts`, or `~/.fonts` for user-specefic
- ensure the files have the correct permissions (644)
- run `fc-cache`

Detail:
To add a font to Debian, you can follow these steps:

1. **System-Wide Installation**:
   - Install the appropriate font package starting with "fonts-" to add fonts system-wide. These fonts will be installed in `/usr/share/fonts` by the package manager.
   - Manually install a font by downloading the `.ttf` or `.otf` files and placing them in `/usr/local/share/fonts` (system-wide), `~/.local/share/fonts`, or `~/.fonts` (user-specific). Ensure the files have the correct permissions (`644`) and update the font cache using `fc-cache`.

2. **Adding Specific Fonts**:
   - If you want to add specific .ttf fonts, place the font files in `/home/<usr>/.fonts`, then run fc-cache to make them available in applications like LibreOffice. Check `/etc/fonts/font.conf` for the correct home directory path.

3. **Enabling Contrib Section**:
   - If you encounter issues with missing font packages like ttf-mscorefonts-installer, ensure you have the contrib section enabled in your sources list by editing `/etc/apt/sources.list` and adding the necessary repositories.

4. **Additional Resources**:
   - You can also explore further resources like GitHub for scripts to install `TTF` fonts in Debian, which involve moving the font files to `/usr/share/fonts/truetype`, updating font configurations, and refreshing the font cache.

## list fonts

```bash
fc-list
```

## view and manage fonts

- pango-view
- fontconfig-tool
- ttfls
