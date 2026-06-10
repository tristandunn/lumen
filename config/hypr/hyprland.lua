-- See https://wiki.hypr.land/Configuring/ for details.

require("appearance")
require("bindings")
require("environment")
require("input")
require("monitors")
require("startup")
require("voxtype")

hl.config({
  ecosystem = {
    -- Disable the popup that shows up twice a year encouraging to donate.
    no_donation_nag = true,

    -- Disable the popup that shows up when you update hyprland to a new version.
    no_update_news = true,
  },
})
