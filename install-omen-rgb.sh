#!/bin/bash
# Installation script for omen-rgb CLI tool

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="omen-rgb"

echo "Installing omen-rgb CLI tool..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root (use sudo)"
    exit 1
fi

# Check if the script exists
if [ ! -f "$SCRIPT_DIR/$SCRIPT_NAME" ]; then
    echo "Error: $SCRIPT_NAME not found in $SCRIPT_DIR"
    exit 1
fi

# Create symlink to /usr/local/bin
echo "Creating symlink: $INSTALL_DIR/$SCRIPT_NAME -> $SCRIPT_DIR/$SCRIPT_NAME"
ln -sf "$SCRIPT_DIR/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"

# Verify installation
if [ -L "$INSTALL_DIR/$SCRIPT_NAME" ]; then
    echo "✓ omen-rgb installed successfully!"
    echo ""
    echo "Usage examples:"
    echo "  sudo omen-rgb --all --color red"
    echo "  omen-rgb --get-all"
    echo "  omen-rgb --help"
else
    echo "✗ Installation failed"
    exit 1
fi
