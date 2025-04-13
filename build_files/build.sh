#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

dnf -y install dnf-plugins-core

dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo



# Installing packages
dnf5 install -y hyprland sddm kitty flatpak nemo git distrobox curl wget docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin NetworkManager nm-connection-editor network-manager-applet blueman bluez waybar rofi-wayland

#Enabling flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo



# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# Enable systemd services
systemctl enable bluetooth
systemctl enable NetworkManager
systemctl enable docker
systemctl enable sddm
systemctl enable podman.socket
