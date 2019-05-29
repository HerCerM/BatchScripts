@echo off

rem Support relative paths
if exist %cd%\%1 (set targetDir=%cd%\%1) else set targetDir=%1

rem Get name of source directory
for /D %%d in (%targetDir%) do set srcDir=%%~nxd

rem Get parent dir of current working dir
for %%a in (%targetDir%) do set outDir=%%~dpa\%srcDir%[webp]
mkdir %outDir%

rem Transform images into new directory
for %%f in (%targetDir%\*.png) do ftra %%f 512 512 webp %outDir%