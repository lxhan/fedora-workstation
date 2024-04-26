#!/bin/bash

# fastestmirror=True
# max_parallel_downloads=10
# defaultyes=True
# keepcache=True

# Update Fedora and get standard repository programs
sudo dnf -y upgrade

# Enable rpm
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core

# Enable flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Media codecs
sudo dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf -y groupupdate sound-and-video

function dnfi {
	which $1 &>/dev/null

	if [ $? -ne 0 ]; then
		echo "Installing: ${1}..."
		sudo dnf -y -q install $1
	else
		echo "Already installed: ${1}"
	fi
}

function fpi {
	which $1 &>/dev/null

	if [ $? -ne 0 ]; then
		echo "Installing: ${1}..."
		flatpak -y -q install flathub $1
	else
		echo "Already installed: ${1}"
	fi
}

# dnf
dnfi dnf-plugins-core
dnfi curl
dnfi wget
dnfi exfat-utils
dnfi file
dnfi nmap
dnfi zsh
dnfi stow
dnfi tree
dnfi nvim
dnfi htop
dnfi jq
dnfi nnn
dnfi zoxide
dnfi python3-venv
dnfi python3-pip
dnfi gnome-tweaks

# flathub
fpi md.obsidian.Obsidian
fpi io.github.Rirusha.Cassette
fpi io.httpie.Httpie
fpi org.telegram.desktop
fpi us.zoom.Zoom
fpi com.valvesoftware.Steam
fpi org.gnome.Extensions
fpi com.mattjakeman.ExtensionManager

# Run all scripts in apps/
for f in apps/*.sh; do bash "$f" -H; done

sudo dnf -y autoremove

# Install fonts
cp -r fonts ${HOME}/.fonts
fc-cache -fv

# Link dotfiles
chsh -s $(which zsh)
stow -t ${HOME} dotfiles/*
