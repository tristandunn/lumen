-- See https://github.com/peteonrails/voxtype for details.

-- Entered by the voxtype service via `hyprctl dispatch 'hl.dsp.submap(...)'`
-- to block modifier keys while text is being typed out.
hl.define_submap("voxtype_suppress", function()
  -- Blocks modifier keys during text output.
  hl.bind("ALT_L", hl.dsp.no_op())
  hl.bind("ALT_R", hl.dsp.no_op())
  hl.bind("CONTROL_L", hl.dsp.no_op())
  hl.bind("CONTROL_R", hl.dsp.no_op())
  hl.bind("SHIFT_L", hl.dsp.no_op())
  hl.bind("SHIFT_R", hl.dsp.no_op())
  hl.bind("SUPER_L", hl.dsp.no_op())
  hl.bind("SUPER_R", hl.dsp.no_op())

  -- Emergency escape.
  hl.bind("F12", hl.dsp.submap("reset"))
end)
