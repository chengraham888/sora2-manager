#!/bin/bash

# Sora2 Manager Icon Conversion Script
# This script converts the SVG icon to various formats needed for Electron builds

echo "Converting Sora2 Manager icon..."

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "ImageMagick is not installed. Please install it first:"
    echo "Ubuntu/Debian: sudo apt-get install imagemagick"
    echo "macOS: brew install imagemagick"
    echo "Windows: Download from https://imagemagick.org/"
    exit 1
fi

# Convert SVG to PNG (for Linux and general use)
echo "Creating PNG icon..."
convert assets/icon.svg -resize 512x512 assets/icon.png

# Convert SVG to ICO (for Windows)
echo "Creating ICO icon..."
convert assets/icon.svg -resize 256x256 assets/icon.ico

# Convert SVG to ICNS (for macOS)
echo "Creating ICNS icon..."
convert assets/icon.svg -resize 512x512 assets/icon-512.png
convert assets/icon.svg -resize 256x256 assets/icon-256.png
convert assets/icon.svg -resize 128x128 assets/icon-128.png
convert assets/icon.svg -resize 64x64 assets/icon-64.png
convert assets/icon.svg -resize 32x32 assets/icon-32.png
convert assets/icon.svg -resize 16x16 assets/icon-16.png

# Create iconset directory for icns
mkdir -p assets/icon.iconset
cp assets/icon-512.png assets/icon.iconset/icon_512x512.png
cp assets/icon-256.png assets/icon.iconset/icon_256x256.png
cp assets/icon-128.png assets/icon.iconset/icon_128x128.png
cp assets/icon-64.png assets/icon.iconset/icon_64x64.png
cp assets/icon-32.png assets/icon.iconset/icon_32x32.png
cp assets/icon-16.png assets/icon.iconset/icon_16x16.png

# Convert to icns (requires iconutil on macOS)
if command -v iconutil &> /dev/null; then
    iconutil -c icns assets/icon.iconset -o assets/icon.icns
    echo "ICNS icon created successfully"
else
    echo "iconutil not found (macOS only). ICNS conversion skipped."
    echo "You can convert manually using online tools or on a Mac."
fi

# Cleanup temporary files
rm -f assets/icon-*.png
rm -rf assets/icon.iconset

echo "Icon conversion completed!"
echo "Generated files:"
echo "  - assets/icon.png (Linux)"
echo "  - assets/icon.ico (Windows)"
echo "  - assets/icon.icns (macOS, if iconutil available)"

echo ""
echo "To build the Electron app with icons:"
echo "npm run electron:build"