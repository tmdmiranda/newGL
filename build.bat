@echo off
setlocal enabledelayedexpansion

:: Color variables
set "RED=[91m"
set "GREEN=[92m"
set "YELLOW=[93m"
set "BLUE=[94m"
set "MAGENTA=[95m"
set "CYAN=[96m"
set "WHITE=[97m"
set "RESET=[0m"

:: Function to display header
:header
cls
echo %BLUE%=============================================%RESET%
echo %YELLOW%      OpenGL Project Build System%RESET%
echo %BLUE%=============================================%RESET%
echo.

:: Main menu
:menu
echo %WHITE%Please select an option:%RESET%
echo %GREEN%[1]%RESET% Get Dependencies
echo %GREEN%[2]%RESET% Build and Run
echo %GREEN%[3]%RESET% Exit
echo.

set /p choice=%YELLOW%Enter your choice (1-3): %RESET%

if "%choice%"=="1" goto get_dependencies
if "%choice%"=="2" goto build_run
if "%choice%"=="3" exit /b

echo %RED%Invalid choice. Please try again.%RESET%
echo.
goto menu

:get_dependencies
echo %CYAN%Setting up dependencies...%RESET%
echo.

:: Check if VCPKG_ROOT is already set
if not defined VCPKG_ROOT (
    echo %YELLOW%VCPKG not found. Downloading and installing vcpkg...%RESET%
    
    :: Clone vcpkg
    echo %WHITE%Cloning vcpkg repository...%RESET%
    git clone https://github.com/Microsoft/vcpkg.git
    if errorlevel 1 (
        echo %RED%Failed to clone vcpkg repository%RESET%
        pause
        goto menu
    )
    
    :: Bootstrap vcpkg
    echo %WHITE%Bootstrapping vcpkg...%RESET%
    cd vcpkg
    .\bootstrap-vcpkg.bat
    if errorlevel 1 (
        echo %RED%Failed to bootstrap vcpkg%RESET%
        pause
        goto menu
    )
    cd ..
    
    :: Set VCPKG_ROOT locally for this session
    set "VCPKG_ROOT=%cd%\vcpkg"
    echo %GREEN%VCPKG_ROOT set to: !VCPKG_ROOT!%RESET%
    
    :: Add to local environment (this session only)
    setx VCPKG_ROOT "!VCPKG_ROOT!" > nul
) else (
    echo %GREEN%VCPKG already installed at: %VCPKG_ROOT%%RESET%
)

echo %WHITE%Getting git submodules...%RESET%
git submodule init
git submodule update
if errorlevel 1 (
    echo %RED%Failed to update submodules%RESET%
    pause
    goto menu
)

echo %GREEN%Dependencies setup complete!%RESET%
pause
goto menu

:build_run
echo %CYAN%Building and running project...%RESET%
echo.

:: Check if VCPKG_ROOT is set
if not defined VCPKG_ROOT (
    echo %RED%VCPKG_ROOT is not set. Please run 'Get Dependencies' first.%RESET%
    pause
    goto menu
)

echo %YELLOW%Creating build directory...%RESET%
if not exist build mkdir build
cd build

echo %YELLOW%Running CMake...%RESET%
cmake -DCMAKE_TOOLCHAIN_FILE=%VCPKG_ROOT%\scripts\buildsystems\vcpkg.cmake ..
if errorlevel 1 (
    echo %RED%CMake configuration failed%RESET%
    pause
    goto menu
)

echo %YELLOW%Building project...%RESET%
cmake --build . --config Debug
if errorlevel 1 (
    echo %RED%Build failed%RESET%
    pause
    goto menu
)

echo %YELLOW%Running application...%RESET%
cd Debug
start ./opengl12.exe
cd ..\..

echo %GREEN%Build and run completed successfully!%RESET%
pause
goto menu