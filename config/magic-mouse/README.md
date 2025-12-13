# Magic Mouse

Adds support for Apple Magic Mouse with natural scrolling.

## Unpairing from macOS

Before pairing with Linux, unpair the mouse from macOS:

1. Open "System Settings > Bluetooth".
2. Right-click the Magic Mouse.
3. Select "Forget...".

## Installation

```sh
make -C config/magic-mouse install
```

Then reload the kernel module (or reboot):

```sh
sudo modprobe -r hid_magicmouse
sudo modprobe hid_magicmouse
```

## Pairing

1. Turn on the Magic Mouse.
2. Pair using `bluetoothctl`:

```sh
bluetoothctl
power on
scan on
# Wait for "Magic Mouse" to appear, note the MAC address
pair XX:XX:XX:XX:XX:XX
trust XX:XX:XX:XX:XX:XX
connect XX:XX:XX:XX:XX:XX
```

Once paired and trusted, the mouse will auto-connect on boot.

## Unpairing from Linux

To unpair the mouse (e.g., before moving it back to another device):

```sh
bluetoothctl
remove XX:XX:XX:XX:XX:XX
```

## Adjusting Scroll Speed

Edit `hid-magicmouse.conf` and change `scroll_speed` (range: 1-63, default: 32).

After editing, reload the module:

```sh
sudo modprobe -r hid_magicmouse
sudo modprobe hid_magicmouse
```
