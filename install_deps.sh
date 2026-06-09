#!/bin/env sh

set -e

CORE_DEV="base-devel cmake clang clang-tools-extra pkg-config"
GRAPHICS_DEV="MesaLib-devel Vulkan-Headers glslang libX11-devel libXrandr-devel libXi-devel libXcursor-devel libXinerama-devel alsa-lib-devel pipewire-devel"
LANG_PKGS="rustup go gopls python3 python3-devel LuaJIT lua54-devel"
WM_PKGS="sway wlroots Waybar SwayNotificationCenter grim slurp wmenu"
TERM_PKGS="ghostty fish-shell neovim git curl fastfetch btop chezmoi"

echo "==> Updating xbps repositories..."
sudo xbps-install -Sy

echo "==> Installing core development toolchain..."
sudo xbps-install -y $CORE_DEV

echo "==> Installing graphics, audio, and language dependencies..."
sudo xbps-install -y $GRAPHICS_DEV $LANG_PKGS

echo "==> Installing Sway WM and terminal environment..."
sudo xbps-install -y $WM_PKGS $TERM_PKGS

if command -v rustup >/dev/null 2>&1; then
    rustup default stable
fi

echo "==> Dependency installation complete successfully!"
