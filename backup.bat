@echo off

:: Error message if a file is not found
set fileNotFound=ERROR: File not found, backup aborted.
:: File path of CSV configuration file
set confFile=%~dp0\bconf.csv

:: Terminate script if configuration file bconf.txt is not found
if not exist %confFile% echo %fileNotFound% & exit /b

:: Recover target folder, backup location and
:: archive password from bconf.txt configuration file
for /f "tokens=1,2,3 delims=," %%a in (%confFile%) do ^
set targetFolder=%%a& set backupLocation=%%b& set password=%%c

:: Check for target and location existence
:: If either doesn't exist, the script terminates
if not exist %targetFolder% echo %fileNotFound% & exit /b
if not exist %backupLocation% echo %fileNotFound% & exit /b

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