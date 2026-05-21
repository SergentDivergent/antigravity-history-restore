@echo off
:: Switch to the directory where the script is located (resolves issues when running as Administrator)
cd /d "%~dp0"

echo ====================================================
echo   Antigravity IDE - Chat & History Migration
echo ====================================================
echo.
echo STEP 1: Please CLOSE Antigravity IDE completely!
echo (Close all windows and wait a few seconds)
echo.
echo STEP 2: Once the IDE is closed, press any key here...
pause > nul

echo.
echo Starting backup of the current state in the new Antigravity IDE...
set "OLD_DIR=%APPDATA%\Antigravity"
set "NEW_DIR=%APPDATA%\Antigravity IDE"

:: Backup new state just in case
if exist "%NEW_DIR%\User\globalStorage\state.vscdb" (
    copy /y "%NEW_DIR%\User\globalStorage\state.vscdb" "%NEW_DIR%\User\globalStorage\state.vscdb.backup_new" > nul
    echo [OK] Backed up new state.vscdb.
)
if exist "%NEW_DIR%\User\workspaceStorage" (
    xcopy /e /i /y /q "%NEW_DIR%\User\workspaceStorage" "%NEW_DIR%\User\workspaceStorage.backup_new" > nul
    echo [OK] Backed up new workspaceStorage.
)

echo.
echo Starting copying of old data from the previous version...

:: Copying database
if exist "%OLD_DIR%\User\globalStorage\state.vscdb" (
    if not exist "%NEW_DIR%\User\globalStorage" mkdir "%NEW_DIR%\User\globalStorage"
    copy /y "%OLD_DIR%\User\globalStorage\state.vscdb" "%NEW_DIR%\User\globalStorage\state.vscdb" > nul
    echo [OK] Successfully copied old state.vscdb - main chat database.
) else (
    echo [WARNING] Old state.vscdb not found!
)

:: Copying workspaceStorage
if exist "%OLD_DIR%\User\workspaceStorage" (
    if exist "%NEW_DIR%\User\workspaceStorage" (
        rmdir /s /q "%NEW_DIR%\User\workspaceStorage" > nul
    )
    xcopy /e /i /y /q "%OLD_DIR%\User\workspaceStorage" "%NEW_DIR%\User\workspaceStorage" > nul
    echo [OK] Successfully copied old workspaceStorage - local project history.
) else (
    echo [WARNING] Old workspaceStorage not found!
)

echo.
echo ====================================================
echo   MIGRATION SUCCESSFULLY COMPLETED!
echo ====================================================
echo You can now restart Antigravity IDE.
echo.
pause
