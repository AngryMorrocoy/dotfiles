from libqtile.config import Key, Group
from libqtile.command import lazy
from settings.keys import mod, keys

group_settings = [
    ["",  {"layout": "max"}],
    ["",  {"layout": "monadtall"}],
    ["嗢", {"layout": "monadtall"}],
    ["",  {"layout": "monadtall"}],
    ["",  {"layout": "monadtall"}],
    ["",  {"layout": "monadtall"}],
    ["",  {"layout": "monadtall"}],
    ["",  {"layout": "monadtall"}]
]

groups = [Group(ws, **kwargs) for ws, kwargs in group_settings]

for i, ws in enumerate(groups, 1):
    keys.extend([
        # Switch to a group with mod+number of that group
        Key([mod], str(i), lazy.group[ws.name].toscreen()),
        # Move a window to a workspace with mod+shift+number of that group
        Key([mod, "shift"], str(i), lazy.window.togroup(ws.name)),
    ])

