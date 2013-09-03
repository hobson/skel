Bugs and solutions when developing on Win XP (32-bit)

# Installed Stack

- Windows XP
- CygWin 1.7
- openssh cygwin module
- Sublime Text 2
- ConEmu
- Git Shell (github)
- Outlook
- MinGW
- Python 2.7 


# Line endings mucking up a bash script copied from internet or DOS

Error message in Cygwin bash:

    -bash: '\r': command not found

Solution: force bash (just the script where this line is inserted?) to ignore carriage returns you must set the igncr option in your bashrc:

    echo "(set -o igncr) 2>/dev/null && set -o igncr; # this comment is needed" | cat - ~/.bashrc >/tmp/.bashrc.tmp && mv /tmp/.bashrc.tmp ~/.bashrc

Alternatively, if you just have on problematic script:

    dos2unix problematic_script.sh



# Some nice sublime settings

Put these in C:/Documents and Settings/laneh/Application Data/Sublime Text 2/Packages/User/Preferences.sublime-settings

    {
    "default_line_ending": "unix",
    "find_selected_text": true,
    "copy_with_empty_selection": false,
    "shift_tab_unindent": true,
    // "ensure_newline_at_eof_on_save": true,
    "ignored_packages":
        [
        "Vintage"
        ]
    }

