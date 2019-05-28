@echo off

rem Get name of source directory
for /D %%d in (%1) do set srcDir=%%~nxd

rem Create directory in desktop for output
set outDir=%USERPROFILE%\Desktop\%srcDir%webp
mkdir %outDir%

rem Transform images into new directory
cd %outDir%
for %%f in (%1\*.png) do ftra %%f 512 512 webp