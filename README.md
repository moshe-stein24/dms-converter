# DMS to Decimal Converter

A cross-platform GUI application to convert DMS (Degrees, Minutes, Seconds) coordinates to decimal format. Perfect for maps, GPS, and navigation applications.

**Supported Platforms:** Windows • macOS • Linux • Android

## Features

✅ **Convert DMS to Decimal** - Enter degrees, minutes, and seconds; get precise decimal coordinates  
✅ **North & East Coordinates** - Separate inputs for Latitude (North) and Longitude (East)  
✅ **7 Decimal Places** - High precision output for all conversions  
✅ **Copy to Clipboard** - One-click copy of decimal coordinates  
✅ **Dark Mode** - Automatic light/dark theme support  
✅ **Cross-Platform** - Same app works on Windows, macOS, Linux, and Android  
✅ **No Installation Required** - Download and run (desktop versions)

## Download

Go to the [Releases page](../../releases) and download the version for your platform:

### Windows
- **dms-converter-windows-x64.zip** - Extract and run `dms_converter.exe`

### macOS
- **dms-converter-macos.zip** - Extract and run the `.app` file

### Linux
- **dms-converter-linux-x64.zip** - Extract and run `dms_converter` binary
- **Requires:** `libgtk-3-0` and `libblkid1`
  ```bash
  sudo apt install libgtk-3-0 libblkid1  # Ubuntu/Debian
  sudo dnf install gtk3                   # Fedora/RHEL
  ```

### Android
- **dms-converter-android.apk** - Install the APK file on your Android device

## Usage

### Basic Conversion

1. **Enter North (Latitude):** degrees, minutes, seconds
   - Example: `40` degrees, `26` minutes, `46.78` seconds
   - Output: `40.4463287`

2. **Enter East (Longitude):** degrees, minutes, seconds
   - Example: `74` degrees, `0` minutes, `21.56` seconds
   - Output: `74.0059889`

3. **View Combined Coordinates**
   - Automatically combines both as: `40.4463287, 74.0059889`

4. **Copy to Clipboard**
   - Click "Copy" button next to any coordinate

### Conversion Formula

```
Decimal = Degrees + (Minutes / 60) + (Seconds / 3600)
```

### Input Ranges

- **Latitude (North):** -90 to +90
- **Longitude (East):** -180 to +180
- **Minutes & Seconds:** Support decimals (e.g., `26.5` or `46.7832`)

## Examples

| Input | Output |
|-------|--------|
| 40°26'46.78"N, 74°0'21.56"E | 40.4463287, 74.0059889 |
| 51°30'26.50"N, 0°7'39.60"W | 51.5073611, -0.1277000 |
| 35°42'46.40"N, 139°44'28.90"E | 35.7128889, 139.7413611 |

## Building from Source

### Requirements
- Flutter 3.16+ ([install](https://flutter.dev/docs/get-started/install))
- Dart SDK (included with Flutter)

### Build Instructions

```bash
# Clone the repository
git clone https://github.com/yourusername/dms-converter.git
cd dms_converter

# Get dependencies
flutter pub get

# Run the app
flutter run

# Build for release
flutter build linux --release    # Linux
flutter build windows --release  # Windows
flutter build macos --release    # macOS
flutter build apk --release      # Android
```

Built files will be in `build/` directory.

## File Structure

```
dms_converter/
├── lib/
│   └── main.dart          # Main app code
├── pubspec.yaml           # Flutter dependencies
├── .github/
│   └── workflows/
│       └── build.yml      # GitHub Actions CI/CD
└── README.md              # This file
```

## License

MIT License - See LICENSE file for details

## Contributing

Contributions are welcome! Feel free to:
- Report bugs via Issues
- Suggest features
- Submit pull requests
- Improve documentation

## Acknowledgments

Built with [Flutter](https://flutter.dev) • Works on all platforms with one codebase

---

**Questions?** Open an issue on GitHub or contact the repository maintainer.
