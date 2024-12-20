#!/bin/bash

# Check if the virtual environment exists, if not create it
if [ ! -d "./ComfyUI/venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv ./ComfyUI/venv
fi

# Activate the virtual environment
source ./ComfyUI/venv/bin/activate

# Run ComfyUI - Version 2.1.0
set -e

# Default configuration
VENV_PATH="./venv"
IP_ADDRESS="127.0.0.1"
PORT="8188"
DEBUG_MODE=0
OUTPUT_DIR="./output"
GPU_ID=""
DOWNLOAD_MODEL=0

# Function to display usage
function usage() {
    cat <<EOF
Usage: $0 [options]

Options:
  -i <ip_address>     Set IP address for the server (default: ${IP_ADDRESS})
  -p <port>           Set port for the server (default: ${PORT})
  -x                  Enable debug mode
  -o <output_dir>     Set custom output directory (default: ${OUTPUT_DIR})
  -g <gpu_id>         Specify GPU ID to use (default: all GPUs)
  -m                  Download default Stable Diffusion model
  -h                  Display this help message
EOF
    exit 1
}

# Parse command-line arguments
while getopts "i:p:xmg:o:h" opt; do
    case $opt in
        i) IP_ADDRESS="$OPTARG" ;;
        p) PORT="$OPTARG" ;;
        x) DEBUG_MODE=1 ;;
        m) DOWNLOAD_MODEL=1 ;;
        g) GPU_ID="$OPTARG" ;;
        o) OUTPUT_DIR="$OPTARG" ;;
        h) usage ;;
        *) usage ;;
    esac
done

# Check if the script is executed in the correct directory
if [ ! -f "main.py" ]; then
    echo "Error: This script must be run from the ComfyUI directory (where main.py is located)."
    exit 1
fi

# Download model if requested
if [ "$DOWNLOAD_MODEL" -eq 1 ]; then
    echo "Downloading default Stable Diffusion model..."
    wget -P models/checkpoints https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors
    echo "Model downloaded to models/checkpoints!"
fi

# Set CUDA_VISIBLE_DEVICES if GPU ID is specified
if [ -n "$GPU_ID" ]; then
    echo "Using GPU ${GPU_ID} for this session..."
    export CUDA_VISIBLE_DEVICES="$GPU_ID"
fi

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Run ComfyUI
echo "Starting ComfyUI on ${IP_ADDRESS}:${PORT}..."
if [ $DEBUG_MODE -eq 1 ]; then
    echo "Debug mode enabled."
    python main.py --listen "${IP_ADDRESS}" --port "${PORT}" --output-directory "$OUTPUT_DIR" --debug
else
    python main.py --listen "${IP_ADDRESS}" --port "${PORT}" --output-directory "$OUTPUT_DIR"
fi
