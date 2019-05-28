@echo off

rem Get alpha mask
magick %1 -resize %2\x%3 aMask.%4
magick aMask.%4 -alpha extract aMask.%4
magick aMask.%4 -gravity center -background black -extent %2\x%3 aMask.%4

rem Get image to mask
magick %1 -resize %2\x%3 mTarget.%4
magick mTarget.%4 -gravity center -extent %2\x%3 mTarget.%4

rem Get file name of argument
for %%f in (%1) do set out=%%~nf

rem Do mTarget.%4 mask with aMask.%4
magick mTarget.%4 aMask.%4 -alpha off -compose copy_opacity -composite %out%.%4

rem Clean up
del aMask.%4 & del mTarget.%4

rem Wait 1 second for clean up
ping -n 2 1.1.1.1 > nul