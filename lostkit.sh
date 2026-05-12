#!/usr/bin/env sh
echo ================================
echo    LostKit - Linux / Mac Setup
echo ================================

# Ensure Python uv is installed
uv --version || curl -LsSf https://astral.sh/uv/install.sh | sh

echo Ensuring required packages are installed...
uv sync

echo ================================
echo    Starting LostKit...
echo ================================

# Hide the console window when launching the app
nohup uv run main.py > lostkit.log 2>&1 &
exit
