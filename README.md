## Recommended setup 💡

Create a directory in %USERPROFILE% (the home directory) and save the batch files there. Add this folder to the user's Path environment variable. If you have trouble modifying the variable there are many helpful resources, e.g.: [this HowTech YouTube video](https://www.youtube.com/watch?v=bEroNNzqlF4). After configuring the Path variable, the batch files can be called like system commands, such as *dir* or *type* (from anywhere in the file system).

## Security

### backup

```
backup
```

Creates (or updates) a password-protected .7z compressed file with the contents of the folder to backup (later referred as `<folder-to-backup>`) in the specified directory (`<location-of-the-backup>`). The first time the script is run an archive will be created. Any subsequent calls to the script (whilst the configuration file bfconf.csv remains the same) will update the archive, deleting from the archive removed files from disk, updating modified files and adding new files. **Neither creating nor updating an archive deletes, adds or modifies sensitive files, i.e. the integrity of `<folder-to-backup>` is kept intact**. This script requires [7-Zip](https://www.7-zip.org/download.html) to be installed and a separate configuration file to work. The file must be named *bconf.csv*, it must exist in the same directory as backup.bat and the content must be a single line with the following format:

```
<folder-to-backup>,<location-of-the-backup>,<password>
```

If the password is omitted, a command line window will prompt the user to enter a password. Pressing just `enter`sets the password to `enter`itself, it's the closes I've found to not setting a password without working extra on the batch script.

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
