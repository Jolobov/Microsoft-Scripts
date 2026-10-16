@echo off
setlocal

set "URL_X86=https://aka.ms/vc14/vc_redist.x86.exe"
set "URL_X64=https://aka.ms/vc14/vc_redist.x64.exe"
set "TEMP_DIR=%TEMP%\VC_Redist"

if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

echo [1/2] Downloading Visual C++ Redistributable x86...
powershell.exe ^
 -NoLogo ^
 -NoProfile ^
 -ExecutionPolicy Bypass ^
 -Command "Invoke-WebRequest -Uri '%URL_X86%' -OutFile '%TEMP_DIR%\vc_redist.x86.exe'"

if errorlevel 1 goto :error

echo [2/2] Downloading Visual C++ Redistributable x64...
powershell.exe ^
 -NoLogo ^
 -NoProfile ^
 -ExecutionPolicy Bypass ^
 -Command "Invoke-WebRequest -Uri '%URL_X64%' -OutFile '%TEMP_DIR%\vc_redist.x64.exe'"

if errorlevel 1 goto :error

echo Installing x86...
start /wait "" "%TEMP_DIR%\vc_redist.x86.exe" /install /quiet /norestart
if errorlevel 1 goto :error

echo Installing x64...
start /wait "" "%TEMP_DIR%\vc_redist.x64.exe" /install /quiet /norestart
if errorlevel 1 goto :error

echo Installation completed.

echo Cleaning up temporary files...
if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%"

echo Cleanup completed.
pause
exit /b 0

:error
set "ERR_CODE=%errorlevel%"
echo An error occurred. Exit code: %ERR_CODE%

echo Cleaning up temporary files...
if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%"

pause
exit /b %ERR_CODE%