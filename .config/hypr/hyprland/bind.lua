local hyprland = hl

local terminal = "ghostty"
local fileManager = "nautilus"
local menu = "rofi -show drun"

local mainMod = "SUPER"

hyprland.bind(mainMod .. " + C", hyprland.dsp.window.close())
hyprland.bind(mainMod .. " + Q", hyprland.dsp.exec_cmd(terminal))
hyprland.bind(
	mainMod .. " + M",
	hyprland.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hyprland.bind(mainMod .. " + E", hyprland.dsp.exec_cmd(fileManager))
hyprland.bind(mainMod .. " + V", hyprland.dsp.window.float({ action = "toggle" }))
hyprland.bind(mainMod .. " + R", hyprland.dsp.exec_cmd(menu))
hyprland.bind(mainMod .. " + P", hyprland.dsp.window.pseudo())
hyprland.bind(mainMod .. " + J", hyprland.dsp.layout("togglesplit"))
hyprland.bind("Print", hyprland.dsp.exec_cmd("sh -c 'grim -g \"$(slurp -d)\" - | wl-copy'"))
hyprland.bind("CTRL + SHIFT + S", hyprland.dsp.exec_cmd("~/.local/bin/wf-recorder.sh"))

hyprland.bind(mainMod .. " + left", hyprland.dsp.focus({ direction = "left" }))
hyprland.bind(mainMod .. " + right", hyprland.dsp.focus({ direction = "right" }))
hyprland.bind(mainMod .. " + up", hyprland.dsp.focus({ direction = "up" }))
hyprland.bind(mainMod .. " + down", hyprland.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hyprland.bind(mainMod .. " + " .. key, hyprland.dsp.focus({ workspace = i }))
	hyprland.bind(mainMod .. " + SHIFT + " .. key, hyprland.dsp.window.move({ workspace = i }))
end

hyprland.bind(mainMod .. " + S", hyprland.dsp.workspace.toggle_special("magic"))
hyprland.bind(mainMod .. " + SHIFT + S", hyprland.dsp.window.move({ workspace = "special:magic" }))

hyprland.bind(mainMod .. " + mouse_down", hyprland.dsp.focus({ workspace = "e+1" }))
hyprland.bind(mainMod .. " + mouse_up", hyprland.dsp.focus({ workspace = "e-1" }))

hyprland.bind(mainMod .. " + mouse:272", hyprland.dsp.window.drag(), { mouse = true })
hyprland.bind(mainMod .. " + mouse:273", hyprland.dsp.window.resize(), { mouse = true })

hyprland.bind(
	"XF86AudioRaiseVolume",
	hyprland.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && ~/.local/bin/volume.sh"),
	{ locked = true, repeating = true }
)
hyprland.bind(
	"XF86AudioLowerVolume",
	hyprland.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && ~/.local/bin/volume.sh"),
	{ locked = true, repeating = true }
)
hyprland.bind(
	"XF86AudioMute",
	hyprland.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hyprland.bind(
	"XF86AudioMicMute",
	hyprland.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hyprland.bind(
	"XF86MonBrightnessUp",
	hyprland.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+ && ~/.local/bin/brightness.sh"),
	{ locked = true, repeating = true }
)
hyprland.bind(
	"XF86MonBrightnessDown",
	hyprland.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%- && ~/.local/bin/brightness.sh"),
	{ locked = true, repeating = true }
)

hyprland.bind("XF86AudioNext", hyprland.dsp.exec_cmd("playerctl next"), { locked = true })
hyprland.bind("XF86AudioPause", hyprland.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hyprland.bind("XF86AudioPlay", hyprland.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hyprland.bind("XF86AudioPrev", hyprland.dsp.exec_cmd("playerctl previous"), { locked = true })

return hyprland
