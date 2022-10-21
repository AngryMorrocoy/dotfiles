import json
import subprocess
from os import path

from libqtile import hook, qtile

from .path import qtile_path


@hook.subscribe.startup_once
def load_external_conf():
    # Called once per start, extra configuration
    script_file = path.join(qtile_path, "load_xinput.py")
    config_file = path.join(qtile_path, "xinput_props.json")
    windows_id_filepath = path.join(qtile_path, "windows_id.json")

    subprocess.call([script_file, config_file])
    subprocess.call(path.join(qtile_path, "autostart.sh"))
    windows_id_file = open(windows_id_filepath, "w")

    json.dump([], windows_id_file)

    windows_id_file.close()


@hook.subscribe.client_focus
def on_focus_change(window):
    """Brings to front a floating windows when focused"""
    if window.info()["floating"]:
        window.cmd_bring_to_front()


@hook.subscribe.setgroup
def bring_always_visible_windows():
    windows_id_filepath = path.join(qtile_path, "windows_id.json")
    ids = []
    with open(windows_id_filepath, "r", encoding="utf-8") as windows_file:
        ids = json.load(windows_file)
    for id in ids:
        try:
            if id in qtile.windows_map:
                qtile.windows_map[id].togroup()
        except Exception:
            continue
