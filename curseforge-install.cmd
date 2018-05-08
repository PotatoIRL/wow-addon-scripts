@echo off
@setlocal enabledelayedexpansion

set ADDON_ID=%1
set ADDONS_FOLDER=F:\World of Warcraft\Interface\AddOns
set ZIP_FILE=%ADDON_ID%.zip
set SITE=https://www.curseforge.com
set DOWNLOAD_PATH=/wow/addons/%ADDON_ID%/download

for /f delims^=^"^ tokens^=2 %%g in ('curl -s %SITE%%DOWNLOAD_PATH% ^| findstr "Elerium.PublicProjectDownload.countdown"') do (
  set FILE_PATH=%%g
)
call curl -s -L %SITE%%FILE_PATH% > %ZIP_FILE%
call 7z x -y -o"%ADDONS_FOLDER%" %ZIP_FILE% | findstr /B /V /I "Extracting"
call del /S /Q %ZIP_FILE%

:end
@endlocal
exit /b 0