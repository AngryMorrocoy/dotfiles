#!/usr/bin/python
import subprocess
import json

workspaces = subprocess.run(["wmctrl", "-d"], capture_output=True).stdout
windows = subprocess.run(["wmctrl", "-l"], capture_output=True).stdout.decode("utf-8")

# Get the index of those workspaces with some window in it
workspaces_with_windows = {
    int(x.split()[1])
    for x in windows.splitlines()
}

ws_n = [False for _ in workspaces.splitlines()]

for window_index in workspaces_with_windows:
    ws_n[window_index] = True

print(json.dumps(ws_n))
