@echo off

:: Folder that will be backed up
set targetFolder=C:\Users\hjcer\Documents\temp\folder
:: Location where the backup will be created
set backupLocation=C:\Users\hjcer\Desktop

set fileNotFound=ERROR: File not found, backup aborted.

:: Check for target and location existence
:: If either doesn't exist, the script terminates
if not exist %targetFolder% echo %fileNotFound% & exit /b
if not exist %backupLocation% echo %fileNotFound% & exit /b

:: Build name of backup file in the following format:
:: 	Backup[<target-folder-name>] Date[<day> <month> <year>]

:: Extract date from 'date /t' command
for /f "tokens=2" %%a in ('date /t') do set today=%%a
:: Extract day, month and year from 'date /t' command
for /f "tokens=1,2,3 delims=./ " %%a in ("%today%") do ^
set day=%%a & set month=%%b & set year=%%c
:: Build name of backup file
for /d %%a in (%targetFolder%) do set folderName=%%~na
set archiveName=Backup[%folderName%] Date[%day%%month%%year%]

:: Recover archive password from bpass.txt
for /f "tokens=*" %%a in (bpass.txt) do set password=%%a
:: Update or create backup of target folder
7z u -r -p%password% "%backupLocation%\%archiveName%" "%targetFolder%"