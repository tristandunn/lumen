# Magic Mouse

Adds support for Apple Magic Mouse.

## Installation

See [hid-magicmouse](https://github.com/tristandunn/hid-magicmouse) for details.

## Preparing

Before pairing with Linux, unpair the mouse from macOS:

1. Open "System Settings > Bluetooth".
2. Right-click the Magic Mouse.
3. Select "Forget...".

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

## Unpairing

To unpair the mouse (e.g., before moving it back to another device):

```sh
bluetoothctl
remove XX:XX:XX:XX:XX:XX
```
