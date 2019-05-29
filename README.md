---
geometry: margin=2.5cm
---

## Image processing
The scripts in this category require [ImageMagick](https://imagemagick.org/) to be installed.

### ftra (File TRAnsform)

```
ftra <target-file> <width> <height> <type> <out-p-dir>
```
| Non-terminal | Description |
|--------------|-------------|
| `<target-file>` | Absolute path to an image file. |
|`<width>` | Converted image width (px). |
| `<height>` | Converted image height (px). |
| `<type>` | Target file type. |
| `<out-p-dir>` | Absolute path of parent directory of output folder. |

Transforms an image, changing its dimensions and type. Currently, only image files with some transparency can be converted to another type which also supports transparency. E.g., PNG with transparent areas to webP. Files which names contain white spaces or commas are not supported.

### wbtra (Whatsapp Batch TRAnsform)

```
wbtra <src-dir>
```

| Non-terminal | Description |
|--------------|-------------|
| `<src-dir>` | Absolute or relative path of directory containing images that can be processed by `ftra`. |

Transforms images in a directory, setting their dimensions to 512x512 px and their type to webP. The output images are placed in a new directory in %USERPROFILE%\\Desktop. The development of this script emerged from the necessity to convert WhatsApp stickers provided in PNG format with varying dimensions to the required standard for providing these stickers in a stickers app.
