# Tailscale

VPN mesh network for secure access to this machine from other devices.

## Post-Install Setup

After `make install`:

1. Authenticate with Tailscale:
   ```
   sudo tailscale up
   ```

2. Enable SSH access via Tailscale:
   ```
   sudo tailscale set --ssh
   ```

3. Configure ACLs in the [Tailscale admin console](https://login.tailscale.com/admin/acls):
   ```json
   "ssh": [{
     "action": "accept",
     "src": ["autogroup:members"],
     "dst": ["autogroup:self"],
     "users": ["autogroup:nonroot"]
   }]
   ```

   This ACL means:
   - `action: accept` - allow the SSH connection
   - `src: autogroup:members` - from any authenticated member of your tailnet
   - `dst: autogroup:self` - to any device owned by the same user
   - `users: autogroup:nonroot` - as any non-root user on the target machine

## Connecting via Device Name

MagicDNS is enabled by default, so you can SSH using the device name instead of IP:

```
ssh <machine-name>
```

The machine name defaults to your hostname. You can rename devices in the
[admin console](https://login.tailscale.com/admin/machines) or set a custom
hostname during setup:

```
sudo tailscale up --hostname=mydesktop
```

## Verification

- Check service: `systemctl status tailscaled`
- Check connection: `tailscale status`
- Get Tailscale IP: `tailscale ip -4`
