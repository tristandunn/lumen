-- See https://wiki.hypr.land/Configuring/Basics/Binds/ for details.

-- {{{ Windows
-- Focus.
hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))

-- Management.
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + W", hl.dsp.exec_cmd("lumen-hypr-dispatch tab-close"))
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd("lumen-hypr-dispatch toggle-float"))

-- Movement.
hl.bind("SUPER + TAB", hl.dsp.window.cycle_next())
hl.bind("SUPER + SHIFT + TAB", hl.dsp.window.cycle_next({ next = false }))
hl.bind("SUPER + GRAVE", function()
  hl.dispatch(hl.dsp.window.cycle_next({ floating = true }))
  hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- Tab navigation.
hl.bind("SUPER + SHIFT + BRACKETLEFT", hl.dsp.exec_cmd("lumen-hypr-dispatch tab-previous"))
hl.bind("SUPER + SHIFT + BRACKETRIGHT", hl.dsp.exec_cmd("lumen-hypr-dispatch tab-next"))
for i = 1, 10 do
  local key = tostring(i % 10) -- 10 maps to key 0
  hl.bind("SUPER + " .. key, hl.dsp.exec_cmd("lumen-hypr-dispatch tab-goto-number " .. key))
end
-- }}}
-- {{{ Workspaces
hl.bind("SUPER + SHIFT + W", hl.dsp.submap("workspace"))

hl.define_submap("workspace", function()
  for i = 1, 10 do
    local key = tostring(i % 10) -- 10 maps to key 0

    -- Switch to workspace, then leave the submap.
    hl.bind(key, function()
      hl.dispatch(hl.dsp.focus({ workspace = i }))
      hl.dispatch(hl.dsp.submap("reset"))
    end)

    -- Move window to workspace, then leave the submap.
    hl.bind("SHIFT + " .. key, function()
      hl.dispatch(hl.dsp.window.move({ workspace = i }))
      hl.dispatch(hl.dsp.submap("reset"))
    end)
  end

  -- Exit workspace mode manually.
  hl.bind("ESCAPE", hl.dsp.submap("reset"))
  hl.bind("RETURN", hl.dsp.submap("reset"))
end)
-- }}}
-- {{{ Applications
-- Launch.
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("walker"))

-- Customization.
hl.bind("SUPER + C", hl.dsp.exec_cmd("lumen-hypr-dispatch copy"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("lumen-hypr-dispatch save"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("lumen-hypr-dispatch paste"))

-- Firefox.
hl.bind("SUPER + A", hl.dsp.exec_cmd("lumen-hypr-dispatch select-all"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("firefox --private-window"))

-- Special workspace (stash current window).
hl.bind("SUPER + G", hl.dsp.workspace.toggle_special("stash"))
hl.bind("SUPER + SHIFT + G", hl.dsp.window.move({ workspace = "special:stash", follow = false }))
hl.bind("SUPER + R", hl.dsp.exec_cmd("lumen-hypr-dispatch reload"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("lumen-hypr-dispatch tab-new"))

-- Steam.
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("$HOME/.local/bin/steam-run"))

-- Voxtype.
hl.bind("SUPER + D", hl.dsp.exec_cmd("voxtype record start"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("voxtype record stop"), { release = true })
-- }}}
-- {{{ System
-- Audio device switching.
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd("lumen-audio-switch"))

-- Brightness control.
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("lumen-brightness-control raise"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("lumen-brightness-control lower"))

-- Lock screen.
hl.bind("SUPER + CTRL + Q", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + SHIFT + ESCAPE", hl.dsp.exec_cmd("systemctl sleep"))

-- Media control.
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- Volume control.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume +5"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume -5"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))
-- }}}
-- {{{ Screenshots
-- Active window capture.
hl.bind("SUPER + P", hl.dsp.exec_cmd("lumen-screenshot window"))

-- Full screen capture.
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("lumen-screenshot screen"))

-- Region selection (click and drag).
hl.bind("SUPER + CTRL + P", hl.dsp.exec_cmd("lumen-screenshot region"))
-- }}}

-- vim:foldmethod=marker:foldlevel=0
