@echo off

rem Get alpha mask
magick %1 -resize %2\x%3 aMask.png
magick aMask.png -alpha extract aMask.png
magick aMask.png -gravity center -background black -extent %2\x%3 aMask.png

rem Get image to mask
magick %1 -resize %2\x%3 mTarget.png
magick mTarget.png -gravity center -extent %2\x%3 mTarget.png

rem Get file name of argument
for %%f in (%1) do set out=%%~nf

rem Do mTarget.png mask with aMask.png
magick mTarget.png aMask.png -quality 50 -define webp:lossless=false -alpha off -compose copy_opacity -composite %4\%out%.webp

rem Clean up
del aMask.png & del mTarget.png