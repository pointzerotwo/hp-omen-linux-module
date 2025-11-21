HP Omen special feature control for Linux
-----------------------------------------

This is a version of the hp-wmi kernel module that implements some of the features of HP Omen Command Centre.

It's totally experimental right now, and could easily crash your machine. 

**USE AT YOUR OWN RISK**

Currently working:

- FourZone keyboard colour control (`/sys/devices/platforms/hp-wmi/rgb-zones/zone0[0-3]`)
- Omen hotkeys

## Installation

1. Install dkms and kernel headers if needed (already present on Ubuntu)

1. Run `sudo make install`

Module will be built and installed, and DKMS will manage rebuilding it on kernel updates.

## Usage

### Using the omen-rgb CLI Tool (Recommended)

The `omen-rgb` CLI tool provides a convenient interface for managing RGB zones.

#### Installation

```bash
sudo ./install-omen-rgb.sh
```

This will create a symlink to `/usr/local/bin/omen-rgb` so you can use it from anywhere.

#### Basic Usage

```bash
# Set a single zone to a color
sudo omen-rgb --zone 0 --color FF0000          # Red using hex
sudo omen-rgb --zone 1 --color red             # Red using color name

# Set multiple zones to the same color
sudo omen-rgb --zones 0,1,2 --color cyan

# Set all zones to the same color
sudo omen-rgb --all --color blue

# Set different colors for different zones
sudo omen-rgb 0:FF0000 1:00FF00 2:0000FF 3:FFFF00

# Get current color of a zone
omen-rgb --get 0

# Get all zone colors
omen-rgb --get-all

# Save current configuration
sudo omen-rgb --save-config my-scheme

# Load saved configuration
sudo omen-rgb --load-config my-scheme

# List saved configurations
omen-rgb --list-configs

# List available color presets
omen-rgb --list-colors

# Show help
omen-rgb --help
```

#### Available Color Presets

The tool supports named colors: `red`, `green`, `blue`, `cyan`, `magenta`, `yellow`, `white`, `orange`, `purple`, `pink`, `lime`, `teal`, `off`, `black`

### Direct sysfs Access (Advanced)

The module creates four files in `/sys/devices/platform/hp-wmi/rgb_zones/` named `zone00 - zone03`.

To change zone highlight color, just print hex colour value in RGB format to the respective file. e.g:

`sudo bash -c 'echo 00FFFF > /sys/devices/platform/hp-wmi/rgb_zones/zone00'` to get sky-blue zone 0.

### Hotkeys

Omen and other hotkeys are bound to regular X11 keysyms, use your chosen desktop's hotkey manager to assign them to functions like any other key.

## To do:

- [ ] FourZone brightness control
- [ ] Fan control 

