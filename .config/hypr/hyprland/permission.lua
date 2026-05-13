local hyprland = hl

hyprland.permission({ binary = "/usr/bin/hyprlock", type = "screencopy", mode = "allow" })
hyprland.permission({ binary = "/usr/bin/grim", type = "screencopy", mode = "allow" })
hyprland.permission({ binary = "/usr/bin/wf-recorder", type = "screencopy", mode = "allow" })
hyprland.permission({ binary = "/usr/lib/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })

return hyprland
