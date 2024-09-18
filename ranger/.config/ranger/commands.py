# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command


class bulkrename(Command):
    """:bulkrename

    This command calls the 'brn2' executable with a list of selected files
    passed as arguments after the '--' separator.
    """
    def execute(self):
        from ranger.container.file import File

        env = os.environ.copy()
        env["EDITOR"] = "nvim"

        filenames = [f.relative_path for f in self.fm.thistab.get_selection()]
        command = ['brn2', '--'] + filenames

        self.fm.run(command, env=env)
