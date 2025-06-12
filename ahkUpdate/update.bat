@echo off
setlocal EnableDelayedExpansion
:: Configuration - Update these values
set "GITHUB_RAW_URL=https://raw.githubusercontent.com/smrini/AutoHotkey/main/keys.ahk"
set "LOCAL_SCRIPT_PATH=C:\Users\smrini\Documents\AutoHotkey\keys.ahk"
set "TEMP_SCRIPT=%TEMP%\ahk_script_latest.ahk"
set "SILENT_MODE=false"

:: Get the directory where this batch file is located
set "SCRIPT_DIR=%~dp0"
set "BACKUP_DIR=%SCRIPT_DIR%backups"

:: Check if running silently (for startup)
if "%1"=="--silent" set "SILENT_MODE=true"

echo Checking for AutoHotkey script updates...

:: Download latest version from GitHub
powershell.exe -Command "try { Invoke-WebRequest -Uri '%GITHUB_RAW_URL%' -OutFile '%TEMP_SCRIPT%' -ErrorAction Stop } catch { exit 1 }"
if %ERRORLEVEL% neq 0 (
    if "%SILENT_MODE%"=="false" (
        echo Error: Failed to download latest version from GitHub
        pause
    )
    exit /b 1
)

:: Check if temp file was created
if not exist "%TEMP_SCRIPT%" (
    if "%SILENT_MODE%"=="false" (
        echo Error: Download failed - temporary file not found
        pause
    )
    exit /b 1
)

:: Compare files using PowerShell
powershell.exe -Command "$local = Get-Content '%LOCAL_SCRIPT_PATH%' -Raw -ErrorAction SilentlyContinue; $remote = Get-Content '%TEMP_SCRIPT%' -Raw; if ($local -ne $remote) { exit 0 } else { exit 1 }"
if %ERRORLEVEL% equ 0 (
    :: Files are different - update needed
    if "%SILENT_MODE%"=="true" (
        :: In silent mode, create a notification file
        echo Update available > "%TEMP%\ahk_update_available.txt"
        echo %date% %time% >> "%TEMP%\ahk_update_available.txt"
        
        :: Show Windows notification
        powershell.exe -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('AutoHotkey script update available. Run update_ahk.bat to update.', 'Script Update', 'OK', 'Information')" >nul 2>&1
    ) else (
        echo.
        echo New version available!
        choice /M "Do you want to update now? (Y/N)"
        if !ERRORLEVEL! equ 1 (
            call :UpdateScript
        ) else (
            echo Update cancelled.
        )
    )
) else (
    :: Files are the same
    if "%SILENT_MODE%"=="false" (
        echo Your script is already up to date.
    )
    :: Clean up temp file
    if exist "%TEMP_SCRIPT%" del "%TEMP_SCRIPT%"
)

if "%SILENT_MODE%"=="false" pause
exit /b 0

:UpdateScript
echo.
echo Creating backup...

:: Ensure backup directory exists
if not exist "%BACKUP_DIR%" (
    mkdir "%BACKUP_DIR%"
    if %ERRORLEVEL% neq 0 (
        echo Error: Failed to create backup directory
        goto :CleanupAndExit
    )
)

:: Create backup with timestamp (using safe filename format)
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "timestamp=!dt:~0,4!-!dt:~4,2!-!dt:~6,2!_!dt:~8,2!-!dt:~10,2!-!dt:~12,2!"
set "backup_filename=keys_backup_!timestamp!.ahk"
set "backup_path=%BACKUP_DIR%\%backup_filename%"

copy "%LOCAL_SCRIPT_PATH%" "%backup_path%" >nul
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to create backup
    goto :CleanupAndExit
)
echo Backup created: %backup_path%

:: Update the script
echo Updating script...
copy "%TEMP_SCRIPT%" "%LOCAL_SCRIPT_PATH%" >nul
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to update script
    echo Restoring from backup...
    copy "%backup_path%" "%LOCAL_SCRIPT_PATH%" >nul
    goto :CleanupAndExit
)

echo Script updated successfully!

:: Ask if user wants to restart AutoHotkey
echo.
choice /M "Do you want to restart AutoHotkey to apply changes? (Y/N)"
if !ERRORLEVEL! equ 1 (
    echo Restarting AutoHotkey...
    
    :: Method 1: Kill existing AutoHotkey processes more effectively
    echo Stopping existing AutoHotkey processes...
    taskkill /f /im "AutoHotkey32.exe" >nul 2>&1
    taskkill /f /im "AutoHotkey64.exe" >nul 2>&1
    taskkill /f /im "AutoHotkeyU32.exe" >nul 2>&1
    taskkill /f /im "AutoHotkeyU64.exe" >nul 2>&1
    taskkill /f /im "AutoHotkey.exe" >nul 2>&1
    
    :: Wait for processes to fully terminate
    timeout /t 3 /nobreak >nul
    
    :: Start the updated script
    echo Starting updated script...
    start "" "%LOCAL_SCRIPT_PATH%"
)

:CleanupAndExit
:: Clean up temp file
if exist "%TEMP_SCRIPT%" del "%TEMP_SCRIPT%"
goto :eof