#!/bin/bash

# List of required packages
REQUIRED_PKGS=("glfw" "glm")  # or "glfw-wayland" if you prefer Wayland

# Check and install missing packages
for pkg in "${REQUIRED_PKGS[@]}"; do
    if ! pacman -Q "$pkg" &>/dev/null; then
        echo "Installing missing package: $pkg"
        sudo pacman -S --noconfirm "$pkg" || {
            echo "Failed to install $pkg. Aborting build." >&2
            exit 1
        }
    fi
done

[ -d ./build ] && { cd build; } || { mkdir build && cd build; }
cmake ..
make
./opengl12
