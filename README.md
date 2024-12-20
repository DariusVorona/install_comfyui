Script Descriptions
install_comfyui_v2.1.0.sh

This script automates the installation of ComfyUI version on Linux systems, managing system dependencies, repository setup, and virtual environment configuration.

Key Features:

    Dependency Installation:
        Checks for the presence of required packages: python3, python3-venv, python3-pip, git, and wget.
        Installs missing packages via the system package manager (requires sudo or root access).

    Virtual Environment Setup:
        Creates a Python virtual environment (venv) within the ComfyUI directory.
        Activates the virtual environment for dependency isolation.

    Dependency Installation:
        Upgrades pip to the latest version within the virtual environment.
        Installs PyTorch (CUDA-enabled version) using the PyTorch-specific index URL.
        Installs additional dependencies from the requirements.txt file in the repository.

    Error Handling:
        Stops execution (set -e) if any step fails, ensuring no incomplete installations.

    Final Output:
        Provides confirmation of successful installation and guidance on running the application using the run_comfyui_v2.1.0.sh script.

Usage: Run this script with execute permissions:

chmod +x install_comfyui_v2.1.0.sh
./install_comfyui_v2.1.0.sh

run_comfyui_v2.1.0.sh

Key Features:

    Environment Verification:
        Ensures the script is executed in the correct directory (where main.py is located).
        Validates the existence of a Python virtual environment (venv).

    Command-Line Configuration:
        Accepts various options to customize runtime behavior:
            -i <ip_address>: Set the server's IP address (default: 127.0.0.1).
            -p <port>: Specify the server port (default: 8188).
            -o <output_dir>: Set the directory for output files (default: ./output).
            -g <gpu_id>: Restrict execution to a specific GPU (default: all GPUs).
            -m: Automatically download a default Stable Diffusion model.
            -x: Enable debug mode for more verbose logging.
            -h: Display a help menu with usage details.

    Model Management:
        Downloads the Stable Diffusion v1.5 model into models/checkpoints if the -m option is specified.
        Ensures compatibility with ComfyUI requirements.

    GPU Configuration:
        Sets the CUDA_VISIBLE_DEVICES environment variable if a GPU ID is provided, enabling multi-GPU systems to target specific hardware.

    Output Directory Handling:
        Creates the specified output directory (-o) if it does not exist, ensuring no interruptions during runtime.

    Debug Mode:
        Enables verbose logging and additional runtime information for troubleshooting purposes when the -x option is specified.

    Execution:
        Starts the ComfyUI application using the Python virtual environment.
        Runs with or without debug mode based on user preferences.

Usage: Run this script with execute permissions:

chmod +x run_comfyui_v2.1.0.sh
./run_comfyui_v2.1.0.sh [options]

Example: To launch the application on a custom IP and port with debug mode enabled:

./run_comfyui_v2.1.0.sh -i 192.168.1.100 -p 8080 -x

