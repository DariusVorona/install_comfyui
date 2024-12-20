ComfyUI v2.1.0 Toolkit for Linux

This repository contains shell scripts to install and run ComfyUI version 2.1.0 on Linux systems. These scripts are designed to streamline the installation and execution process, ensuring a smooth user experience.
Files
install_comfyui_v2.1.0.sh

Purpose: Automates the installation process for ComfyUI on Linux.
Features:

    Linux-Specific Installation:
        Compatible with common Linux distributions.
        Leverages system tools and package managers for smooth integration.
    Dependency Management:
        Automatically identifies and installs required dependencies (e.g., Python libraries, system packages).
    Version Locking:
        Ensures that all installed components are compatible with ComfyUI v2.1.0.
    Error Handling:
        Provides clear error messages to guide users through troubleshooting.

Usage:

chmod +x install_comfyui_v2.1.0.sh
./install_comfyui_v2.1.0.sh

run_comfyui_v2.1.0.sh

Purpose: Launches ComfyUI after installation, preparing the environment and starting the application.
Features:

    Environment Setup:
        Configures environment variables and runtime requirements specific to Linux.
    Ease of Use:
        A single command to start ComfyUI with minimal user intervention.
    Error Handling:
        Notifies users of missing dependencies or configuration issues.
    Version Specific:
        Optimized for ComfyUI v2.1.0 to ensure consistent behavior.

Usage:

chmod +x run_comfyui_v2.1.0.sh
./run_comfyui_v2.1.0.sh


Installation Guide

    Clone this repository:


Run the installation script:

./install_comfyui_v2.1.0.sh

Start ComfyUI using the runtime script:

    ./run_comfyui_v2.1.0.sh

Contribution

Contributions to enhance these scripts are welcome. If you'd like to contribute:

    Fork the repository.
    Create a new branch: git checkout -b feature-branch-name.
    Submit a pull request.


