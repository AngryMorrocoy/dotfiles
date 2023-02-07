#!/usr/bin/python
import subprocess
import json

proc = subprocess.run(["wmctrl", "-d"], capture_output=True)
workspaces = [
    line.split() for line in proc.stdout.decode("utf-8").splitlines()
]  # Put each line of the output as a list

# Get only the index and 'name' of the workspace
workspaces = [[ws[0], ws[-1]] for ws in workspaces]


print(json.dumps(workspaces))
