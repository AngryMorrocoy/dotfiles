from os import environ

from libqtile import widget
from settings.themes import colors


def base(fg="text", bg="bar_color", font="DroidSansMono Nerd Font"):
    return {
        "foreground": colors[fg],
        "background": colors[bg],
        "font": font,
    }


def separator(color="bar_color", padding=5):
    return widget.Sep(**base(fg=color, bg=color), padding=padding)


def round_powerline(fg="text", bg="bar_color"):
    return widget.TextBox(**base(fg, bg), text="", fontsize=30, padding=0)


def text_icon(
    fg="icons_fg",
    bg="bar_color",
    fontsize=15,
    text="?",
    font="DroidSansMono Nerd Font",
    mouse_callbacks={},
):
    return widget.TextBox(
        **base(fg, bg, font),
        fontsize=fontsize,
        text=text,
        padding=1,
        mouse_callbacks=mouse_callbacks,
    )


groupbox = [
    widget.GroupBox(
        **base(bg="groupbox_bg"),
        fontsize=15,
        padding_x=10,
        padding_y=8,
        margin=3,
        highlight_color=colors["group_selected_bg"],
        active=colors["group_active_fg"],
        this_current_screen_border=colors["group_selected_bg"],
        inactive=colors["group_inactive_fg"],
        urgent_border=colors["group_urgent_bg"],
        highlight_method="block",
        rounded=False,
        disable_drag=True,
        use_mouse_wheel=False,
    ),
    widget.WindowName(
        **base(bg="bar_color", font="DroidSansMono Nerd Font"),
        format="",
        max_chars=50,
        padding=3,
        fontsize=12,
    ),
]

mainbar_widgets = [
    widget.Prompt(
        **base(bg="bar_color"),
        prompt=f" {environ['USER']}> ",
        padding=5,
    ),
    *groupbox,
    round_powerline("hid_widgets_bg", "bar_color"),
    widget.WidgetBox(
        widgets=[
            separator("hid_widgets_bg"),
            text_icon(bg="hid_widgets_bg", text=" "),
            widget.Net(
                **base(bg="hid_widgets_bg"),
                interface="wlp1s0",
                fontsize=12,
            ),
            separator("hid_widgets_bg"),
            separator("hid_widgets_separator"),
            separator("hid_widgets_bg"),
            text_icon(bg="hid_widgets_bg", text=" "),
            widget.ThermalSensor(
                **base(bg="hid_widgets_bg"), format="{temp:.1f} {unit}"
            ),
            separator("hid_widgets_bg"),
            round_powerline("hid_widgets_separator", "hid_widgets_bg"),
            round_powerline("hid_widgets_bg", "hid_widgets_separator"),
        ],
        **base(bg="hid_widgets_bg"),
        text_closed=" ",
        text_open=" ",
        close_button_location="right",
    ),
    separator("hid_widgets_bg"),
    round_powerline("layout_indicator_bg", "hid_widgets_bg"),
    widget.CurrentLayoutIcon(**base(bg="layout_indicator_bg"), scale=0.8),
    separator("layout_indicator_bg", padding=3),
    widget.CurrentLayout(**base(bg="layout_indicator_bg"), fontsize=13),
    separator(color="layout_indicator_bg", padding=10),
    round_powerline("clock_bg", "layout_indicator_bg"),
    text_icon(bg="clock_bg", text=" "),
    widget.Clock(
        **base(bg="clock_bg"),
        format="%H:%M [%a %d/%m/%Y] ",
        fontsize=14,
    ),
    round_powerline("systray_bg", "clock_bg"),
    widget.Systray(**base(bg="systray_bg"), icon_size=15, padding=9),
    separator("systray_bg"),
]

extra_bar_widgets = [
    *groupbox,
    round_powerline("layout_indicator_bg", "bar_color"),
    widget.CurrentLayoutIcon(**base(bg="layout_indicator_bg"), scale=0.8),
    separator("layout_indicator_bg", padding=3),
    widget.CurrentLayout(
        **base(bg="layout_indicator_bg", font="Dyuthi Regular"), fontsize=13
    ),
]


widget_defaults = {
    "font": "UbuntuMono Nerd Font Bold",
    "fontsize": 14,
    "padding": 1,
}
extension_defaults = widget_defaults.copy()
