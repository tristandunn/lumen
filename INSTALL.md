# Install Arch Linux

This guide is specifically for installing Arch Linux on a Framework Desktop with
an AMD processor, AMD GPU, 64 GB of RAM, and an NVMe SSD. It builds a minimal base
system that's ready to run the included scripts in this repository.

The installation will create a system with two partitions: a 512MB EFI system
partition and a root partition using the remaining disk space. The base system
includes the essential tools and network connectivity needed for the included
scripts, along with a few optimizations.

## Getting Started

Boot from the USB device you've flashed Arch Linux to, likely with
[balenaEtcher](https://etcher.balena.io).

## Double the Terminal Size

If you prefer, double the terminal font size with the `-d` flag to make it more
legible on large screens.

```sh
setfont -d ter-132b
```

## Partition the SSD

Framework Desktop uses NVMe SSDs, which typically appear as `/dev/nvme0n1`. If
you want to be sure about the device name, you can identify available storage
devices first.

```sh
lsblk
```

We'll create two partitions using the GUID Partition Table:

- **512MB EFI System Partition** (ESP) - Stores the boot loader and kernel.
- **Remaining space for root** - The main Linux file system.

```sh
# Launch the interactive partitioner.
gdisk /dev/nvme0n1

# Create a new table and clear the existing partitions.
o

# Create the 512MB EFI system partition.
n
> Partition number: 1
> First sector: (Enter)
> Last sector: +512M
> Hex code: EF00

# Create the root partition with the remaining space.
n
> Partition number: 2
> First sector: (Enter)  # Start immediately after the first partition.
> Last sector: (Enter)   # Use all of the remaining space.
> Hex code: 8300

# Write and exit.
w
```

You can double check the partitions, if you prefer.

```sh
lsblk
```

## Format the Partitions

The EFI system partition must be formatted as FAT32, which is required by the
UEFI specification. The `-F32` flag explicitly specifies FAT32 format.

```sh
mkfs.fat -F32 /dev/nvme0n1p1
```

The root partition uses EXT4, a stable and widely-used Linux file system with
journaling support.

```sh
mkfs.ext4 /dev/nvme0n1p2
```

## Mount the Partitions

Mount the root partition first at `/mnt`, then mount the EFI partition at
`/mnt/boot`. The `--mkdir` flag creates the boot directory, if it doesn't exist,
and the `noatime` option reduces SSD wear by not updating file access
timestamps.

```sh
mount -o noatime /dev/nvme0n1p2 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
```

## Connect to the Internet

Internet connectivity is required to download and install base system packages.
We'll use `iwctl` to connect to a wireless network.

```sh
# Launch the wireless daemon.
iwctl

# List the devices if needed.
device list

# Framework Desktop uses `wlan0` as its wireless interface name so we can scan
# for available networks, list them, and then connect.
station wlan0 scan
station wlan0 get-networks
station wlan0 connect "SSID Name"

# Exit the daemon.
exit
```

## Install the Base System

Install the minimal base system with essential packages, which includes:

- `amd-ucode` - AMD processor microcode updates.
- `base` - Minimal package set to define a basic installation.
- `base-devel` - Development tools.
- `git` - Version control system needed for install scripts.
- `less` - Terminal pager for viewing file contents.
- `linux` - The Linux kernel.
- `linux-firmware` - Firmware files for hardware devices.
- `networkmanager` - Network connection manager.
- `vim` - Text editor for configuration.
- `zsh` - Z shell for a custom shell.

```sh
pacstrap /mnt amd-ucode base base-devel git less linux linux-firmware \
  networkmanager vim zsh
```

## Generate the System Table

Generate the file system table (`fstab`) configuration. The `-U` flag uses UUIDs
instead of device names to make the configuration more robust across reboots.

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

You can `cat /mnt/etc/fstab` to verify the entries if you prefer.

## Switch to the System

Change root into the new system to configure it. This allows you to run commands
as if you've booted into the installed system.

```sh
arch-chroot /mnt
```

## Create a Swap File

Create a swap file for virtual memory.

```sh
# Create an 8,192MB (8GB) file filled with zeros.
dd if=/dev/zero of=/swapfile bs=1M count=8192 status=progress

# Set secure permissions.
chmod 600 /swapfile

# Format the file as swap space.
mkswap /swapfile

# Activate the swap file.
swapon /swapfile

# Add an entry to `fstab` so it's enabled at boot.
echo "/swapfile none swap sw 0 0" >> /etc/fstab
```

Adjust the swap behavior for a system with sufficient RAM. Setting
`vm.swappiness=10` reduces swap usage, preferring to keep data in RAM, since
this is primarily for emergency memory pressure or hibernation.

```sh
echo "vm.swappiness=10" > /etc/sysctl.d/99-swappiness.conf
```

## Create a Temporary File System

Configure `/tmp` as a `tmpfs` with a 4GB limit. This keeps temporary files in
RAM for faster access and automatically clears them on reboot. The size is a
maximum limit, not a reservation—unused space costs no memory.

```sh
vim /etc/fstab

tmpfs /tmp tmpfs rw,nodev,nosuid,size=4G 0 0
```

The mount options provide security hardening:

- `nodev` - Prevents device files from being created.
- `nosuid` - Prevents setuid binaries from running.

## Set a Time Zone

Configure the system timezone and synchronize the hardware clock to ensure
correct timestamps and time-based operations.

```sh
# Set the time zone to US Eastern.
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

# Set the hardware clock from the system clock.
hwclock --systohc
```

## Set a Localization

Configure the system language and regional settings, which determine how dates,
numbers, currency, and text are formatted and displayed.

```sh
# Uncomment `en_US.UTF-8 UTF-8` from the file.
vim /etc/locale.gen

# Generate the locales.
locale-gen

# Set the system locale.
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

## Set a Hostname

Set the system hostname to "lumen", which identifies the machine on the network.

```sh
echo "lumen" > /etc/hostname
```

Add the hostname to the hosts file for local name resolution.

```sh
vim /etc/hosts

127.0.0.1 lumen.localdomain lumen
```

## Set a Root Password

Set a strong password for the root account. This is critical for system
security, as root has full administrative access.

```sh
passwd
```

## Install a Boot Loader

Install systemd-boot, a simple UEFI boot manager. This configures the system to
boot automatically into Arch Linux.

```sh
bootctl install
```

Customize the boot loader settings with the following:

- `default arch` - Use the "arch" boot entry by default.
- `timeout 0` - Boot immediately without showing a menu.
- `console-mode max` - Use maximum console resolution.
- `editor no` - Disable boot parameter editing for security.

```sh
vim /boot/loader/loader.conf

default arch
timeout 0
console-mode max
editor no
```

Create the boot entry for Arch Linux, which specifies:

- The kernel location at `/vmlinuz-linux`.
- The AMD microcode image at `/amd-ucode.img` is loaded first.
- Then the initramfs image at `/initramfs-linux.img` is loaded.
- The boot options include the root partition, read-write mode, and quiet boot.

Note: The `options` line uses a hard-coded device path (`/dev/nvme0n1p2`)
instead of a UUID. This is simpler but may fail if device naming changes. For
this specific Framework Desktop setup, the device path is stable and reliable.

```sh
vim /boot/loader/entries/arch.conf

title   Arch Linux
linux   /vmlinuz-linux
initrd  /amd-ucode.img
initrd  /initramfs-linux.img
options root=/dev/nvme0n1p2 rw quiet
```

## Add a User

Create a regular user account with `sudo` privileges. Be sure to replace
`username` with your desired username. The flags provided are:

- `-m` - Create a home directory.
- `-G wheel` - Add user to the wheel group for `sudo` access.
- `-s /usr/bin/zsh` - Set `zsh` as the default shell.

```sh
useradd -m -G wheel -s /usr/bin/zsh username
```

Set the user's password:

```sh
passwd username
```

Grant `sudo` privileges to the wheel group by uncommenting a specific line.

```sh
# Uncomment: %wheel ALL=(ALL:ALL) ALL
EDITOR=vim visudo
```

## Enable the Network Manager

Enable `NetworkManager` to start automatically at boot, ensuring network
connectivity is available after reboot.

```sh
systemctl enable NetworkManager
```

## Enable SSD Optimization

Enable periodic TRIM operations for the NVMe SSD. This helps maintain SSD
performance and longevity by allowing the drive to efficiently manage deleted
data blocks.

```sh
systemctl enable fstrim.timer
```

## Exit and Reboot

Exit the `chroot` environment and reboot into the newly installed system. Remove
the USB installation media if needed.

```sh
exit

reboot
```

## Connect to a Network

After rebooting, reconnect to your network using the `NetworkManager` text
interface. The network configuration from the live environment doesn't persist
to the installed system.

```sh
nmtui
```

## Update the System

Update all installed packages to their latest versions.

```sh
sudo pacman -Syu
```

The base system is now ready to run the install scripts in this repository.
