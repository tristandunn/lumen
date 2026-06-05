# Steam

## CS2 Mouse Fix

CS2 runs through XWayland, where the in-game pointer grab is translated wrong
and aim is confined to part of the screen and springs back. Restarting or
switching workspaces only fixes it until the next launch. Across the
Hyprland/Linux CS2 community, the only reliable fix is **gamescope's
`--force-grab-cursor`**, which grabs the cursor itself and feeds CS2 clean
relative motion. Software cursors, Hyprland updates, fullscreen toggles, and
scale changes do not fix it.

Running gamescope on the scaled 5K desktop, though, causes soft upscaling, a
tiny cursor, and wrong sensitivity. The fix is to drop the panel to its native
**2560x1440 scale-1** mode first, so gamescope renders 1:1 — sharp, normal
cursor and sensitivity, full FPS.

The `cs2` wrapper does both: switch to 1440/scale-1, run CS2 under gamescope
with `--force-grab-cursor`, and restore the 5K desktop on exit (quit, kill, or
crash, via `trap`). It auto-detects the connected monitor with `hyprctl` rather
than hard-coding the connector name.

Set it as the launch options (CS2 > Properties > Launch Options):

```
cs2 %command% -vulkan
```

Also set CS2's in-game resolution to **2560x1440**. The wrapper is symlinked
into `~/.local/bin` by `make link`, needs the `gamescope` package (from
`install.sh`), and assumes Hyprland for the `hyprctl` mode switching.
