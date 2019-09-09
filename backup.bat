@echo off
setlocal

:: File path of CSV configuration file
set confFile=%~dp0\bconf.csv

:: Terminate script if configuration file bconf.csv is not found
call :checkFileExistence %confFile%
if %errorlevel%==1 exit /b 1

:: Recover target folder, backup location and
:: archive password from bconf.csv configuration file
for /f "tokens=1,2,3 delims=," %%a in (%confFile%) do ^
set targetFolder=%%a& set backupLocation=%%b& set password=%%c

:: Check for target and location existence
:: If either doesn't exist, the script terminates
call :checkFileExistence %targetFolder%
if %errorlevel%==1 exit /b 1
call :checkFileExistence %backupLocation%
if %errorlevel%==1 exit /b 1

:: Build name of backup file in the following format:
:: 	Backup[<target-folder-name>] Date[<day> <month> <year>]

:: Extract date from 'date /t' command
for /f "tokens=2" %%a in ('date /t') do set today=%%a
:: Extract day, month and year from 'date /t' command
for /f "tokens=1,2,3 delims=/ " %%a in ("%today%") do ^
set day=%%a& set month=%%b& set year=%%c
:: Build name of backup file
for /d %%a in (%targetFolder%) do set folderName=%%~na
set archiveName=Backup[%folderName%] Date[%day%-%month%-%year%]

:: Backup file path
:: Update or create backup of target folder
7z u -r -p%password% "%backupLocation%\%archiveName%" "%targetFolder%"
exit /b 0

:checkFileExistence
:: Error message if a file is not found
set fileNotFound=ERROR: File not found, backup aborted.
if not exist %~1 echo %fileNotFound% & pause & exit /b 1
exit /b 0