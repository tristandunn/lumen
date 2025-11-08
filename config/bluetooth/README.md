# Bluetooth Configuration

This directory contains Bluetooth configuration for the system, including support for Apple Magic devices.

## Installation

Run `make install` to:
- Install required Bluetooth packages (bluez, bluez-utils, blueman, pavucontrol)
- Install audio support packages (pipewire, pipewire-pulse, pipewire-audio, wireplumber)
- Enable the Bluetooth service
- Install Apple Magic device configurations

## Apple Magic Devices

### Magic Mouse

The Magic Mouse configuration (`hid_magicmouse.conf`) includes:
- **Middle-click emulation**: Disabled by default (set to `0`)
- **Scroll acceleration**: Enabled (`1`)
- **Scroll speed**: Set to `55` (range: 0-63, higher = faster)

To adjust these settings, edit `hid_magicmouse.conf` and run `make install` again. You'll need to reload the kernel module or reboot:

```bash
sudo rmmod hid_magicmouse
sudo modprobe hid_magicmouse
```

### Magic Keyboard

The Magic Keyboard configuration (`hid_apple.conf`) includes:
- **fnmode**: Set to `2` (F-keys default, use Fn for media keys)
  - `0` = disabled
  - `1` = media keys default, use Fn for F-keys
  - `2` = F-keys default, use Fn for media keys
- **swap_opt_cmd**: Enabled (`1`) - swaps Option and Command keys for macOS muscle memory
- **swap_fn_leftctrl**: Disabled (`0`)
- **iso_layout**: Disabled (`0`)

To adjust these settings, edit `hid_apple.conf` and run `make install` again. You'll need to reload the kernel module or reboot:

```bash
sudo rmmod hid_apple
sudo modprobe hid_apple
```

## Pairing Devices

To pair Apple Magic devices:

1. Open Blueman Manager (available via Walker or run `blueman-manager`)
2. Put your device in pairing mode:
   - **Magic Mouse**: Turn off, then hold the power button until the LED blinks
   - **Magic Keyboard**: Turn off, then hold the power button until the LED blinks
3. In Blueman, click Search and select your device
4. Follow the pairing prompts (keyboard may require entering a PIN)

Alternatively, use `bluetoothctl`:

```bash
bluetoothctl
power on
agent on
scan on
# Wait for your device to appear
pair <MAC_ADDRESS>
connect <MAC_ADDRESS>
trust <MAC_ADDRESS>
```

## Audio Control

Use `pavucontrol` (PulseAudio Volume Control) to:
- Manage audio devices
- Switch between audio outputs
- Adjust volume levels for Bluetooth audio devices

Launch it via Walker or run `pavucontrol` from the terminal.

## References

- [Arch Wiki: Apple Keyboard](https://wiki.archlinux.org/title/Apple_Keyboard)
- [Arch Wiki: Bluetooth Mouse](https://wiki.archlinux.org/title/Bluetooth_mouse)
