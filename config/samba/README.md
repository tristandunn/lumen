# Samba

SMB file sharing with Avahi service discovery for macOS.

## Setup

After install, set your SMB password (separate from your Linux password):

```
sudo smbpasswd -a tristan
```

## Verification

```
sudo systemctl status avahi-daemon nmbd smbd
testparm -s
```

The machine should appear in macOS Finder's Network sidebar. Connect with username `tristan` and the password set above.

## Share

- **Path:** `~/Public` (read-write, password-protected)
- **Protocol:** SMB3 minimum
- **Discovery:** Avahi mDNS (automatic Finder integration)
