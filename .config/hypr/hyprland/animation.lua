local hyprland = hl

hyprland.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hyprland.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hyprland.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hyprland.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hyprland.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hyprland.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hyprland.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hyprland.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hyprland.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hyprland.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hyprland.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hyprland.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hyprland.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hyprland.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hyprland.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hyprland.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hyprland.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hyprland.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hyprland.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hyprland.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hyprland.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hyprland.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hyprland.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hyprland.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

return hyprland
