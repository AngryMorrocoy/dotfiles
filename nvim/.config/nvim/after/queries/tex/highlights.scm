;; extends
(
    generic_command
        command: (command_name) @cname
        (#match? @cname "(cos|sin|tan)")
        (#set! conceal "trig")
)
