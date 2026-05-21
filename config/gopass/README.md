# gopass

Password manager backed by GPG with optional git-based sync.

## Generate a GPG Key

A GPG key is required before initializing the password store. Check for an
existing secret key first.

```sh
gpg --list-secret-keys
```

If no key exists, generate one. Choose RSA, at least 4096 bits, a 5-10 year
expiry, and a strong passphrase—stronger than any secret you intend to store.

```sh
gpg --full-generate-key
```

The `rng-tools` package is installed alongside `gopass` to accelerate key
generation by feeding the kernel entropy pool.

## Initialize the Store

Run the interactive setup, which configures the crypto backend (GPG), the
storage backend (gitfs), and optionally a remote for sync.

```sh
gopass setup
```

The root store lives at `$XDG_DATA_HOME/gopass/stores/root` by default and
is implicit—no `[mounts]` entry is written for it. Additional sub-stores or
a non-default path can be configured later with `gopass mounts add`.

## Add a Remote

To sync the store across machines, attach a git remote.

```sh
gopass git remote add origin git@github.com:username/password-store.git
gopass sync
```

With `autosync` and `autopush` enabled in the config, future changes push
automatically.

## Browser Integration

The `gopass-jsonapi` package provides the native messaging bridge used by
[gopassbridge](https://github.com/gopasspw/gopassbridge) in Firefox and
Chromium. It ships as a standalone binary that must be configured once
per browser—the command writes a native messaging manifest into a
browser-specific directory, so each browser needs its own run.

```sh
gopass-jsonapi configure
```

The interactive prompt asks which browser to target and where the
`gopass` binary lives. The resulting manifest lands in one of:

- `~/.mozilla/native-messaging-hosts/` — Firefox.
- `~/.config/google-chrome/NativeMessagingHosts/` — Chrome.
- `~/.config/chromium/NativeMessagingHosts/` — Chromium.
- `~/.config/BraveSoftware/Brave-Browser/NativeMessagingHosts/` — Brave.

If a new browser is added later, re-run `gopass-jsonapi configure` for
it. The browser extension itself must still be installed from the
respective add-on store and granted access to the native messaging host
on first use.

## Import from Apple Passwords

Export passwords from the Apple Passwords app (File → Export → Export
Passwords...) and feed the resulting CSV to the import script. Entries are
stored under the `apple/` prefix as `apple/<hostname>/<username>`, where
`<hostname>` comes from the URL column (with a leading `www.` stripped) so
gopassbridge's auto-match finds them—the extension searches for paths
containing the page hostname as a complete segment. The OTPAuth column is
preserved so `gopass otp` continues to work.

```sh
# Preview without writing.
lumen-gopass-import-apple --dry-run ~/Downloads/Passwords.csv

# Import for real.
lumen-gopass-import-apple ~/Downloads/Passwords.csv

# Use a different prefix or overwrite existing entries.
lumen-gopass-import-apple --prefix websites --force ~/Downloads/Passwords.csv
```

Shred the CSV after a successful import—it contains every password in
plaintext.

```sh
shred -u ~/Downloads/Passwords.csv
```

## One-Time Passwords

gopass can generate TOTP codes from a secret containing an `otpauth://` URL,
which replaces a dedicated 2FA app for sites that expose the URL behind their
QR code. Decode a QR image with `zbarimg` if only the image is available.

```sh
# Store the otpauth URL as the secret body.
gopass insert -m websites/example.com/totp

# Generate the current code and copy it to the clipboard.
gopass otp -c websites/example.com/totp
```

HOTP is supported via `otpauth://hotp/...` URLs using the same command.

## Common Commands

```sh
# Add a new secret interactively.
gopass insert websites/example.com

# Generate a password and store it.
gopass generate websites/example.com 32

# Copy a password to the clipboard (cleared after `cliptimeout`).
gopass show -c websites/example.com

# Search across all secrets.
gopass find example

# Edit an existing secret.
gopass edit websites/example.com
```
