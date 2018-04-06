"""
Dockerfile Generator

Usage:
    dockergen.py (<language> | -t <template> -c <config_file>)

Arguments:
    <language>              Choose a language from one of the default templates.
    <template>              Custom template file in .j2 format. Must specify config file.
    <config_file>           Custom config file in .yml format. Must specify template file.

Options:
    -c, --config            Custom config file in .yml format. Must also specify template file.
    -t, --template          Custom template file in .j2 format. Must also specify config file.
    -h, --help              Show help.
    -v, --version           Show version.

"""
from docopt import docopt


def dockergen():
    return docopt(__doc__,version='1.0.0')
