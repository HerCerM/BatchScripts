@echo off

rem Get file name of argument
for %%f in (%1) do set out=%%~nf

rem Create webP file
magick %1 -resize 512x512 %2\temp.png
magick %2\temp.png -background none -gravity center -extent 512x512 %2\temp.png
cwebp -q 50 %2\temp.png -o %2\%out%.webp

rem Clean up
del %2\temp.png