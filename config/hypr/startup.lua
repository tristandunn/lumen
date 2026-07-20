-- See https://wiki.hypr.land/Configuring/Basics/Autostart/ for details.

-- Autostart applications.
hl.on("hyprland.start", function()
  hl.exec_cmd("pidof hyprlock || hyprlock")
  hl.exec_cmd("elephant")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("walker --gapplication-service")
  hl.exec_cmd("systemctl --user start swayosd.service")
  hl.exec_cmd("waybar")
  hl.exec_cmd("systemctl --user start voxtype.service")
end)
