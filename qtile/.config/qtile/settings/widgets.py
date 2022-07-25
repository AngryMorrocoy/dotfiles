from os import environ

from libqtile import widget
from settings.themes import colors


def base(fg="text", bg="color1", font="DroidSansMono Nerd Font"):

    return {
        "foreground": colors[fg],
        "background": colors[bg],
        "font": font,
    }


def separator(color="color1", padding=5):
    return widget.Sep(**base(fg=color, bg=color), padding=padding)


def round_powerline(fg="text", bg="color1"):
    return widget.TextBox(**base(fg, bg), text="", fontsize=30, padding=0)


def text_icon(
    fg="text",
    bg="color1",
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
        **base(font="Karumbi Bold"),
        fontsize=18,
        padding_x=8,
        padding_y=8,
        margin=3,
        border_width=1,
        highlight_color=colors["color2"],
        active=colors["active"],
        this_current_screen_border=colors["color2"],
        inactive=colors["inactive"],
        urgent_border=colors["urgent"],
        highlight_method="block",
        rounded=True,
        disable_drag=True,
        use_mouse_wheel=False,
    ),
    widget.WindowName(
        **base(font="DroidSansMono Nerd Font"),
        format="",
        max_chars=50,
        padding=3,
        fontsize=12,
    ),
]

mainbar_widgets = [
    widget.Prompt(
        **base(bg="color1", font="DroidSansMono Nerd Font"),
        prompt=f" {environ['USER']}> ",
        padding=5,
    ),
    *groupbox,
    round_powerline("color2", "color1"),
    widget.CurrentLayoutIcon(**base(bg="color2"), scale=0.8),
    separator("color2", padding=3),
    widget.CurrentLayout(
        **base(bg="color2", font="Dyuthi Regular"), fontsize=13
    ),
    separator("color2"),
    round_powerline("color1", "color2"),
    text_icon(fg="color4", bg="color1", text=" "),
    widget.Net(
        **base(bg="color1", font="Dyuthi Regular"),
        interface="wlp1s0",
        fontsize=12,
    ),
    separator("color1"),
    round_powerline("color2", "color1"),
    text_icon(fg="color4", bg="color2", text=" "),
    widget.Clock(
        **base(bg="color2", font="agave Nerd Font r"),
        format="%H:%M [%a %d/%m/%Y] ",
        fontsize=14,
    ),
    round_powerline("color1", "color2"),
    widget.Systray(**base(bg="color3"), icon_size=15, padding=9),
    separator("color3"),
]


widget_defaults = {
    "font": "UbuntuMono Nerd Font Bold",
    "fontsize": 14,
    "padding": 1,
}
extension_defaults = widget_defaults.copy()
