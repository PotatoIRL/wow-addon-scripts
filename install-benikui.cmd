@setlocal enabledelayedexpansion
@echo off

set ADDONS_FOLDER=F:\World of Warcraft\Interface\AddOns
set ELVUI_ARCHIVE=https://git.tukui.org/elvui/elvui/repository/master/archive.zip
set BENIKUI_ARCHIVE=https://www.tukui.org/addons.php?download=11

set ZIP_FILE=elvui.zip
call curl %ELVUI_ARCHIVE% > %ZIP_FILE%
call 7z x -y -o"%ADDONS_FOLDER%" %ZIP_FILE% | findstr /B /V /I "Extracting"
for /f "tokens=1" %%g in ('ls "%ADDONS_FOLDER%" ^| findstr elvui-master*') do ( 
	for /d %%a in ("%ADDONS_FOLDER%\%%g\*.*") do (
		rmdir /S /Q "%ADDONS_FOLDER%\%%~nxa"
		move /Y "%%a" "%ADDONS_FOLDER%"
	)
	rmdir /S /Q %ADDONS_FOLDER%\%%g
)
call del /S /Q %ZIP_FILE%

set ZIP_FILE=benikui.zip
call curl %BENIKUI_ARCHIVE% > %ZIP_FILE%
call 7z x -y -o"%ADDONS_FOLDER%" %ZIP_FILE% | findstr /B /V /I "Extracting"
call del /S /Q %ZIP_FILE%

:end
@endlocal
exit /b 0
