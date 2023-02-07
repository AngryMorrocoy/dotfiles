import subprocess

from libqtile import bar
from libqtile.config import Screen

from .widgets import mainbar_widgets, extra_bar_widgets
from settings.themes import colors

screens = [
    Screen(
        # top=bar.Bar(mainbar_widgets, 20, background=colors["bar_color"])
    ),
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
    connected_monitors = 1
else:
    connected_monitors = int(command.stdout.decode("UTF-8"))

if connected_monitors > 1:
    for _ in range(1, connected_monitors):
        screens.append(Screen(top=bar.Bar(extra_bar_widgets, 20)))
