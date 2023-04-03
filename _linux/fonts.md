---
title: chagne the deafult font
---

[Debian](https://wiki.debian.org/Fonts)
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

