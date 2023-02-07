from os import environ

from libqtile.command import lazy
from libqtile.config import Key, KeyChord

from .extra import (
    move_floating,
    resize_floating,
    toggle_always_visible,
    window_to_next_group,
    window_to_prev_group,
)

terminal = "alacritty"
wallpapers_path = "/home/mr/Wallpapers/"

HOME = environ["HOME"]
mod = "mod4"
alt = "mod1"

keys = [
    Key(key[0], key[1], *key[2:])
    for key in [
        # --Shows a terminal--#
        [[mod], "Return", lazy.spawn(f"{terminal}")],
        #
        [[mod], "period", lazy.next_screen()],
        [[mod], "comma", lazy.prev_screen()],
        # --Switch tabs--#
        [
            [alt],
            "Tab",
            lazy.spawn("rofi -matching regex -modi window -show window"),
        ],
        # Special keys
        # --Screenshot--#
        [[], "Print", lazy.spawn("flameshot launcher")],
        # --Volume--#
        [
            [],
            "XF86AudioRaiseVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
        ],
        [
            [],
            "XF86AudioLowerVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
        ],
        [
            [],
            "XF86AudioMute",
            lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
        ],
        # --Brightness--#
        [[], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")],
        [[], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")],
        # Windows movements and control
        # --Moving floating windows--
        [[mod], "Left", lazy.function(move_floating, -20, 0)],
        [[mod], "Up", lazy.function(move_floating, 0, -20)],
        [[mod], "Right", lazy.function(move_floating, 20, 0)],
        [[mod], "Down", lazy.function(move_floating, 0, 20)],
        # --Resizing floating windows--
        [[mod, "shift"], "Left", lazy.function(resize_floating, -20, 0)],
        [[mod, "shift"], "Up", lazy.function(resize_floating, 0, -20)],
        [[mod, "shift"], "Right", lazy.function(resize_floating, 20, 0)],
        [[mod, "shift"], "Down", lazy.function(resize_floating, 0, 20)],
        # --Close a window--#
        [[mod], "w", lazy.window.kill()],
        # --Switch between windows in current stack pane
        [[mod], "k", lazy.layout.up()],
        [[mod], "j", lazy.layout.down()],
        [[mod], "h", lazy.layout.left()],
        [[mod], "l", lazy.layout.right()],
        [[mod, "control"], "j", lazy.group.prev_window()],
        [[mod, "control"], "k", lazy.group.next_window()],
        # --Sitch window focus to other pane(s) of stack
        [[mod], "space", lazy.layout.next()],
        # --Move windows on current stack--#
        [[mod, "shift"], "k", lazy.layout.shuffle_up()],
        [[mod, "shift"], "j", lazy.layout.shuffle_down()],
        # --Change size of the windows (MonadTall)--#
        [
            [mod, "shift"],
            "h",
            lazy.layout.grow(),
            lazy.layout.increase_nmaster(),
            lazy.layout.grow_left(),
        ],
        [
            [mod, "shift"],
            "l",
            lazy.layout.shrink(),
            lazy.layout.decrease_nmaster(),
            lazy.layout.grow_right(),
        ],
        # -- Columns layout things --#
        [[mod, "control"], "h", lazy.layout.swap_column_left()],
        [[mod, "control"], "l", lazy.layout.swap_column_right()],
        # --Toggle window types--#
        [[mod, "shift"], "a", lazy.function(toggle_always_visible)],
        [[mod, "shift"], "o", lazy.window.toggle_fullscreen()],
        [[mod, "shift"], "f", lazy.window.toggle_floating()],
        # --Normalize and maximize the size of the windows (Mondad/tall/wide)
        [[mod, "shift"], "n", lazy.layout.normalize()],
        # Layout managements and control
        # --Switch sides of the layout--#
        [[mod, "shift"], "space", lazy.layout.rotate(), lazy.layout.flip()],
        # --Switch between available layouts--#
        [[mod], "Tab", lazy.next_layout()],
        [[mod, "shift"], "Tab", lazy.prev_layout()],
        # --Movement between groups--#
        [[mod], "p", lazy.screen.next_group()],
        [[mod, "shift"], "p", lazy.function(window_to_next_group)],
        [[mod], "u", lazy.screen.prev_group()],
        [[mod, "shift"], "u", lazy.function(window_to_prev_group)],
        # Music management
        # --Volup and voldown--#
        [
            [mod, alt],
            "Prior",
            lazy.spawn("playerctl --player=vlc,%any volume 0.05+"),
        ],
        [
            [mod, alt],
            "Next",
            lazy.spawn("playerctl --player=vlc,%any volume 0.05-"),
        ],
        # --Next and previous song--#
        [[mod, alt], "End", lazy.spawn("playerctl --player=vlc,%any next")],
        [
            [mod, alt],
            "Home",
            lazy.spawn("playerctl --player=vlc,%any previous"),
        ],
        # --Play/Pause and Stop--#
        [
            [mod, "control"],
            "Next",
            lazy.spawn("playerctl --player=vlc,%any play-pause"),
        ],
        [
            [mod, "control"],
            "Prior",
            lazy.spawn("playerctl --player=vlc,%any stop"),
        ],
        # --Go -10 & +10 seconds--#
        [
            [mod, "control"],
            "End",
            lazy.spawn("playerctl --player=vlc,%any position 10+"),
        ],
        [
            [mod, "control"],
            "Home",
            lazy.spawn("playerctl --player=vlc,%any position 10-"),
        ],
        # Open systray
        [[mod, "shift"], "s", lazy.spawn("stalonetray")],
        # Toggle bar
        [[mod, "shift"], "b", lazy.spawn("eww-toggle_vertical_bar")],
        # Qtile management
        [[mod], "r", lazy.spawn("rofi -modi run -show run")],
        [[mod, "control"], "r", lazy.restart()],
        [[mod, "control"], "q", lazy.shutdown()],
    ]
]

keys += [
    KeyChord(keychord[0], keychord[1], keychord[2])
    for keychord in [
        # --Keychords for rofi, all of them start with mod+m--#
        [
            [mod],
            "m",
            [
                Key(key[0], key[1], *key[2:])
                for key in [
                    # --Launchs the menu of launching--#
                    [
                        [],
                        "e",
                        lazy.spawn("rofi -matching regex -modi drun,run -show drun"),
                    ],
                    # --The script for searching across the web--#
                    [[], "s", lazy.spawn("rofi-search")],
                    # -- Tmux launchers --
                    [
                        ["shift"],
                        "t",
                        lazy.spawn("rofi-tmux-sessionizer"),
                    ],
                    [
                        ["shift"],
                        "s",
                        lazy.spawn("rofi-tmux-sessions"),
                    ],
                    [
                        [],
                        "k",
                        lazy.spawn("rofi-keyboard"),
                    ],
                    [
                        [],
                        "w",
                        lazy.spawn("rofi-wifi"),
                    ],
                ]
            ],
        ],
        # --Keychord to launch my common used stuff--#
        [
            [mod],
            "e",
            [
                Key(key[0], key[1], *key[2:])
                for key in [
                    # --Launchs firefox--#
                    [[], "1", lazy.spawn("firefox")],
                    # --Launchs audacious--#
                    [[], "2", lazy.spawn("audacious")],
                    # --Launchs vifm--#
                    [[], "3", lazy.spawn(f"{terminal} -e ranger")],
                    # --Launchs thunar--#
                    [[], "e", lazy.spawn("thunar")],
                    # --Launchs nitrogen--#
                    [[], "w", lazy.spawn(f"nitrogen '{wallpapers_path}'")],
                    # --Launchs zeal--#
                    [[], "p", lazy.spawn("zeal")],
                    # --Launchs htop--#
                    [[], "h", lazy.spawn(f"{terminal} -e bashtop")],
                    # --Launchs qalculate--#
                    [[], "c", lazy.spawn("qalculate-gtk")],
                    # --Launchs discord--#
                    [[], "d", lazy.spawn("discord")],
                    # --Launchs vim--
                    [[], "v", lazy.spawn(f"{terminal} -e nvim")],
                    # --Launchs obsidian--
                    [[], "o", lazy.spawn("obsidian")],
                    # --Launchs mail-client--
                    [[], "m", lazy.spawn("evolution")],
                    # --Launchs spotify--
                    [[], "s", lazy.spawn("spotify")],
                    # --Launchs zathura--
                    [[], "z", lazy.spawn("zathura")],
                ]
            ],
        ],
    ]
]
