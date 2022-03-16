from .widgets import mainbar_widgets, infobar_widgets
from libqtile.config import Screen
from libqtile import bar
import subprocess

screens = [
    Screen(top=bar.Bar(mainbar_widgets, 15), bottom=bar.Bar(infobar_widgets, 16)),
]

xrandr = "xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l"

command = subprocess.run(
    xrandr,
    shell=True,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
)

if command.returncode != 0:
    error = command.stderr.decode("UTF-8")
    logger.error(f"Failed counting monitors using {xrandr}:\n{error}")
    connected_monitors = 1
else:
    connected_monitors = int(command.stdout.decode("UTF-8"))

if connected_monitors > 1:
    for _ in range(1, connected_monitors):
        screens.append(Screen(top=bar.Bar(infobar_widgets, 15)))
