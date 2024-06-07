---
title: how we can find and delete metadata of files
description:
---

# mat2
```bash
sudo apt install mat2

# you will now end up with a file called filename.cleaned.pdf
mat2 filename.pdf

# this will overwrite original file with the new one
mat2 --inplace filename.pdf

# show the metadata
mat2 -s filename.pdf
```

# pdftk
[Ref](https://stackoverflow.com/questions/60738960/remove-pdf-metadata-removing-complete-pdf-metadata)

# exiftools, qpdf, exiv2, ffmpeg
[Ref](https://www.baeldung.com/linux/files-remove-metadata)

# exiftools needs qpdf
[Ref](https://askubuntu.com/a/1331315/1385572)
