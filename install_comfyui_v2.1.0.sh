#!/bin/bash

# Install ComfyUI - Version 2.1.0
set -e

echo "Setting up ComfyUI..."

# Function to check if a package is installed
function check_package_installed() {
    dpkg -l | grep -qw "$1" || return 1
}

# Function to check if a command exists
function check_command_exists() {
    command -v "$1" >/dev/null 2>&1 || return 1
}

# Install system dependencies
echo "Installing system dependencies..."
for package in python3 python3-venv python3-pip git wget; do
    if ! check_package_installed "$package"; then
        echo "Installing $package..."
    else
        echo "$package is already installed."
    fi
done

# Clone the repository
if [ ! -d "ComfyUI" ]; then
    echo "Cloning ComfyUI repository..."
    git clone https://github.com/comfyanonymous/ComfyUI.git
else
    echo "ComfyUI repository already exists."
fi

# Navigate to ComfyUI directory
cd ComfyUI

# Set up virtual environment
if [ ! -d "./venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
    echo "Virtual environment created."
else
    echo "Virtual environment already exists."
fi

# Activate virtual environment
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install PyTorch and dependencies
echo "Installing PyTorch and dependencies..."
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124

# Install additional dependencies
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

echo "ComfyUI installation complete! Use 'run_comfyui.sh' to start the interface."
