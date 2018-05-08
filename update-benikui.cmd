@setlocal enabledelayedexpansion
@echo off

set ADDONS_FOLDER=F:\World of Warcraft\Interface\AddOns
set DOWNLOAD_URL=https://www.tukui.org/addons.php?download=11
set ZIP_FILE=benikui.zip

call curl %DOWNLOAD_URL% > %ZIP_FILE%
call 7z x -y -o"%ADDONS_FOLDER%" %ZIP_FILE% | findstr /B /V /I "Extracting"
call del /S /Q %ZIP_FILE%

:end
@endlocal
exit /b 0