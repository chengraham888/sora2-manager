# Sora2 Manager Icon Setup

This directory contains the icon assets for the Sora2 Manager application.

## Icon Design

The icon features:
- **Play button**: Represents video generation functionality
- **Film strip elements**: Decorative holes and lines representing video/movie theme
- **Blue color scheme**: Matches the application's UI theme
- **Modern design**: Clean and professional appearance

## Files

- `icon.svg` - Source SVG icon (512x512)
- `icon.png` - PNG format for Linux (generated)
- `icon.ico` - ICO format for Windows (generated)
- `icon.icns` - ICNS format for macOS (generated)

## Converting Icons

### Option 1: Automated Script (Recommended)

If you have ImageMagick installed:

```bash
# Install ImageMagick (Ubuntu/Debian)
sudo apt-get install imagemagick

# Or macOS
brew install imagemagick

# Run conversion script
./convert-icons.sh
```

### Option 2: Online Tools

Use online icon converters:
1. Go to https://favicon.io/favicon-converter/
2. Upload `assets/icon.svg`
3. Download the generated ICO, PNG, and ICNS files
4. Place them in the `assets/` directory

### Option 3: Manual Conversion

Use any image editor or converter to create:
- `icon.png` (512x512) for Linux
- `icon.ico` (256x256) for Windows
- `icon.icns` for macOS

## Building with Icons

Once icons are converted, build the Electron app:

```bash
npm run electron:build
```

The icons will be automatically included in the built application.