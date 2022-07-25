import json
from os import path


from .path import qtile_path


def window_to_next_group(qtile):
    """Swithcs the actual window to the next group"""
    group_names = [x.name for x in qtile.groups]
    current_group = qtile.current_group.name
    next_group = qtile.groups[
        (group_names.index(current_group) + 1) % len(group_names)
    ]
    qtile.current_window.cmd_togroup(next_group.name)

    qtile.current_screen.toggle_group(next_group)


def window_to_prev_group(qtile):
    """Swithcs the actual window to the previous group"""
    group_names = [x.name for x in qtile.groups]
    current_group = qtile.current_group.name
    next_group = qtile.groups[
        (group_names.index(current_group) - 1) % len(group_names)
    ]
    qtile.current_window.cmd_togroup(next_group.name)

    qtile.current_screen.toggle_group(next_group)


def move_floating(qtile, dx, dy):
    """Function for moving floating windows, only if they're floating"""
    curr_window_info = qtile.current_window.info()
    if curr_window_info["floating"]:
        qtile.current_window.cmd_move_floating(dx, dy)


def resize_floating(qtile, dw, dh):
    """Function for resizing floating windows, only if they're floating"""
    curr_window_info = qtile.current_window.info()
    if curr_window_info["floating"]:
        qtile.current_window.cmd_resize_floating(dw, dh)


def toggle_always_visible(qtile):
    windows_id_filepath = path.join(qtile_path, "windows_id.json")
    curr_window_id = qtile.current_window.info()["id"]
    ids = []
    with open(windows_id_filepath, "r", encoding="utf-8") as windows_file:
        ids = json.load(windows_file)
    try:
        curr_w_idx = ids.index(curr_window_id)
        ids.pop(curr_w_idx)
    except ValueError:
        ids.append(curr_window_id)
    with open(windows_id_filepath, "w", encoding="utf-8") as windows_file:
        json.dump(ids, windows_file)
