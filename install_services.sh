#!/bin/env sh

set -e

SERVICE_PKGS="cronie unbound wpa_supplicant scx elogind turnstile switcheroo-control dbus pipewire wireplumber"

echo "==> Syncing repositories and installing core services..."
sudo xbps-install -Syu $SERVICE_PKGS

echo "==> Deploying custom Unbound configuration..."
if [ -f "services/unbound.conf" ]; then
    sudo cp services/unbound.conf /etc/unbound/unbound.conf
    echo "    [+] unbound.conf deployed successfully."
else
    echo "    [-] Warning: services/unbound.conf not found in current directory!"
fi

echo "==> Configuring turnstiled..."
if command -v turnstiled >/dev/null 2>&1; then
    sudo sed -i 's/^manage_rundir = yes/manage_rundir = no/' /etc/turnstile/turnstiled.conf
    sudo ln -sf /etc/sv/turnstiled /var/service/
    echo "    [+] turnstiled configured and enabled."
fi

if [ -d "services/scx_bpfland" ] || [ -f "services/scx_bpfland" ]; then
    echo "==> Configuring scx..."
    sudo rm -rf /etc/sv/scx_bpfland
    sudo cp -r services/scx_bpfland /etc/sv/
    if [ -f "/etc/sv/scx_bpfland/run" ]; then
        sudo chmod +x /etc/sv/scx_bpfland/run
    fi
    sudo ln -sf /etc/sv/scx_bpfland /var/service/
fi

echo "==> Enabling system services in /var/service/..."
sudo ln -sf /etc/sv/dbus               /var/service/
sudo ln -sf /etc/sv/crond              /var/service/
sudo ln -sf /etc/sv/elogind            /var/service/
sudo ln -sf /etc/sv/switcheroo-control /var/service/
sudo ln -sf /etc/sv/unbound            /var/service/
sudo ln -sf /etc/sv/wpa_supplicant     /var/service/

echo "==> Services setup completed successfully!"
