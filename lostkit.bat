@echo off
echo ================================
echo    LostKit - Windows Setup (uv)
echo ================================
echo.

REM Check for uv, install if missing
uv --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: uv is not installed!
    echo.
    echo Attempting automatic intstallation...
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
)

REM Check for uv again, fallback to pip if still missing
uv --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: uv is not installed!
    echo.
    echo Falling back to old installer...
    start setup_windows.bat
    exit
)

echo.
echo Ensuring required packages are installed...
echo.

uv sync

echo.
echo ================================
echo    Starting LostKit...
echo ================================
echo.
timeout /t 1 /nobreak >nul

REM Hide the console window when launching the app
start "" /B uv run main.py
exit
