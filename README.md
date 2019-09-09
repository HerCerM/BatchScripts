## Security

### backup

```
backup
```

Creates (or updates) a password-protected .7z compressed file with the contents of the folder to backup (later referred as `<folder-to-backup>`) in the specified directory (`<location-of-the-backup>`). Each day, the first time the command is run a new .7z file is created. Any subsequent calls during the same day updates the same file. **Update upon the .7z file does not remove files, only adds files or updates modified files**. This script requires a separate configuration file to work. The file must be named *bconf.csv*, it must exist in the same directory as backup.bat and the content must be a single line with the following format:

```
<folder-to-backup>,<location-of-the-backup>,<password>
```

## Image processing

The scripts in this category require [ImageMagick](https://imagemagick.org/) and [cwebp](https://developers.google.com/speed/webp/docs/precompiled) to be installed and accessible from any path in cmd.exe (`Path` user environment variable may need to be configured).

### witra (Whatsapp Image TRAnsform)

```
witra <target-file> <out-p-dir>
```

| Non-terminal    | Description                                         |
| --------------- | --------------------------------------------------- |
| `<target-file>` | Absolute path to a PNG image file.                  |
| `<out-p-dir>`   | Absolute path of parent directory of output folder. |

Transforms a target PNG image to a 512x512px webP < 100Kb file. Aspect ratio of image contents and transparency are not changed. Files which names contain white spaces or commas are not supported.

### wbtra (Whatsapp Batch TRAnsform)

```
wbtra <target-dir>
```

| Non-terminal   | Description                                                                                |
| -------------- | ------------------------------------------------------------------------------------------ |
| `<target-dir>` | Absolute or relative path of directory containing images that can be processed by `witra`. |

Processes images contained in the target directory with `witra`. The output images are placed in a new folder in the parent directory of the target directory. The development of this script emerged from the necessity to convert a large number of WhatsApp stickers provided in PNG with varying dimensions to the required [standard](https://github.com/WhatsApp/stickers/tree/master/Android).

## Recommended setup

Create a directory in %USERPROFILE% (the home directory) and save the batch files there. Add this folder to the user's Path environment variable. The batch files can now be called like system commands.
