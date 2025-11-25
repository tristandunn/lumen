# Bluetooth

Adds support for Bluetooth with SBC-XQ codec for high-quality audio.

## Pairing Headphones

1. Put headphones in pairing mode.
2. Pair using `bluetoothctl`:

```sh
bluetoothctl
power on
scan on
# Wait for device to appear, note the MAC address
pair XX:XX:XX:XX:XX:XX
trust XX:XX:XX:XX:XX:XX
connect XX:XX:XX:XX:XX:XX
```

Once paired and trusted, the headphones will auto-connect on boot.

## Verifying the Codec

Check the active codec with:

```sh
pactl list sinks | grep -A 20 bluez
```

Look for `api.bluez5.codec = "sbc_xq"` for best quality.
