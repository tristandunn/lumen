-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/ for details.

-- GTK: Use Wayland if available; if not, try X11 and then any other GDK
-- backend.
hl.env("GDK_BACKEND", "wayland,x11,*")

-- Run SDL2 applications on Wayland. Remove or set to x11 if games that provide
-- older versions of SDL cause compatibility issues.
hl.env("SDL_VIDEODRIVER", "wayland")

-- Clutter package already has Wayland enabled, this variable will force Clutter
-- applications to try and use the Wayland backend.
hl.env("CLUTTER_BACKEND", "wayland")

-- Enables automatic scaling, based on the monitor's pixel density.
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- Tell Qt applications to use the Wayland backend, and fall back to X11 if
-- Wayland is unavailable.
hl.env("QT_QPA_PLATFORM", "wayland;xcb")

-- Disables window decorations on Qt applications.
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- XDG specific environment variables are often detected through portals and
-- applications that may set those for you, however it is not a bad idea to set
-- them explicitly.
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- GTK HiDPI scaling factor.
hl.env("GDK_SCALE", "2")

-- Set the cursor theme and size to match macOS.
hl.env("XCURSOR_THEME", "macOS")
hl.env("XCURSOR_SIZE", "24")
