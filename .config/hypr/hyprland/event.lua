local hyprland = hl

hyprland.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --all")
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

return hyprland
