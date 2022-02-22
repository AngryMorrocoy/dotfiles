import subprocess
import requests
import re
import json
from bs4 import BeautifulSoup
from .path import qtile_path
from os import path


def window_to_next_group(qtile):
    """Swithcs the actual window to the next group"""
    group_names = [x.name for x in qtile.groups]
    current_group = qtile.current_group.name
    next_group = qtile.groups[(group_names.index(current_group) + 1) % len(group_names)]
    qtile.current_window.cmd_togroup(next_group.name)

    qtile.current_screen.toggle_group(next_group)


def window_to_prev_group(qtile):
    """Swithcs the actual window to the previous group"""
    group_names = [x.name for x in qtile.groups]
    current_group = qtile.current_group.name
    next_group = qtile.groups[(group_names.index(current_group) - 1) % len(group_names)]
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


def get_dollar():
    """Access the DolarToday data, and get dollar price"""
    dolar_today_url = "https://s3.amazonaws.com/dolartoday/data.json"

    try:
        page = requests.get(dolar_today_url)
    except Exception as e:
        return re.search("<class '(.*)'", str(e.__class__)).groups()[0]
    if not page.ok:
        return "Couldn't get the data"

    json_data = page.json()

    fecha = json_data["_timestamp"]["fecha"]
    dollar_price = json_data["USD"]["promedio"]

    return f"{dollar_price} Bs.D ({fecha})"


def get_battery_status():
    """This functions returns an unicode formated battery status"""
    ICONS = {
        "C": [x + " " for x in ""],
        "D": [x + "  " for x in ""],
        "U": [x + "  " for x in ""],
    }
    try:
        bats_out = subprocess.check_output("bats", universal_newlines=True).rstrip()
    except subprocess.CalledProcessError:
        return ""

    batt_lvl, batt_status = re.search("^(\d+)(\D{1})$", bats_out).groups()
    batt_lvl = int(batt_lvl)

    if batt_status == "F":
        return f"  {batt_lvl}%"

    batt_icon = ""

    for i, icon in enumerate(ICONS[batt_status], 1):
        if round(batt_lvl / 10) <= i:
            break
        batt_icon = icon
    return f"{batt_icon}{batt_lvl}%"


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


def get_current_keyboard_layout():
    process = subprocess.run(
        ["setxkbmap", "-query"], universal_newlines=1, capture_output=1
    )
    keyboard_layout_result = list(
        filter(lambda x: "layout" in x, process.stdout.split("\n"))
    )
    current_keyboard_layout = keyboard_layout_result[0].split(" ")[-1]
    return current_keyboard_layout


def toggle_keyboard_layout():
    AVAILABLE_LAYOUTS = ["latam", "latam-dvorak"]

    current_layout = get_current_keyboard_layout()

    new_idx = (AVAILABLE_LAYOUTS.index(current_layout) + 1) % len(AVAILABLE_LAYOUTS)

    process = subprocess.run(
        ["setxkbmap", AVAILABLE_LAYOUTS[new_idx]],
        universal_newlines=1,
    )
