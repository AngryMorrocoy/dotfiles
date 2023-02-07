from libqtile import layout
from libqtile.config import Match
from settings.themes import colors

layout_theme = {
    "border_width": 2,
    "margin": 8,
    "border_focus": colors["focused"][0],
    "border_normal": colors["unfocused"][0],
}

layouts = [
    layout.Max(**{ k:v for k,v in layout_theme.items() if k not in ["margin", "border_width"] }),
    layout.MonadTall(**layout_theme),
    layout.Columns(
        **{
            k: v for k, v in layout_theme.items() if k not in ["margin", "border_width"]
        },
        margin=2,
        border_width=1,
        columns=2,
    ),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(title="Qalculate!"),
        Match(wm_class="gpick"),
    ],
    **{key: value for key, value in layout_theme.items() if key != "margin"},
)
