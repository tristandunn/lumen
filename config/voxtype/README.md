# Voxtype

Use `Super+D` to record, transcribe, and type with
[Voxtype](https://github.com/peteonrails/voxtype).

## Setup

### Model and GPU

1. Set up a model.
   ```sh
   voxtype setup model
   ```
2. Enable GPU acceleration.
   ```sh
   sudo voxtype setup gpu --enable
   ```
3. Restart the service.
   ```sh
   systemctl --user restart voxtype
   ```

### Audio Input

The audio device is set to `"default"` in `config.toml`, which uses the PipeWire
default source. This should be the Studio Display monitor microphone since using
a headset microphone would require Bluetooth HFP profile switching degrading the
output audio quality.

Verify the default source with `wpctl status`, or change it with `wpctl
set-default <source-id>`.
