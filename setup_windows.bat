@echo off
echo ================================
echo    LostKit - Windows Setup (pip)
echo ================================
echo.

REM Check for Python
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed!
    echo.
    echo Please install the latest version of Python (v3.10 or later) from:
    echo https://www.python.org/downloads/
    echo.
    echo Make sure to check "Add Python to PATH" during installation.
    echo.
    pause
    exit /b 1
)

REM Check Python version
for /f "tokens=2" %%I in ('python --version 2^>^&1') do set PYTHON_VERSION=%%I
echo Found Python version: %PYTHON_VERSION%

echo.
echo Ensuring required packages are installed...
echo.

python -m pip install -r requirements.txt

echo.
echo ================================
echo    Starting LostKit...
echo ================================
echo.
timeout /t 1 /nobreak >nul

REM Hide the console window when launching the app
start "" /B python main.py
exit

