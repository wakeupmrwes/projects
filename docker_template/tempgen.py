import os.path
from jinja2 import Environment, FileSystemLoader
import yaml
import sys


class Tempgen(object):

    def __init__(self, options):

        THIS_DIR = os.path.dirname(os.path.abspath(__file__))
        CONFIG_DIR = os.path.join(THIS_DIR, 'config')

        self.language = options['<language>']
        config = str(options['<config_file>']) if options['<config_file>'] else os.path.join(CONFIG_DIR, str(options['<language>'])+'.yml')
        try:
            self.config_data = yaml.load(open(config))
        except:
            print("Config file not found or is not a valid .yml")
            sys.exit(0)

        self.template = str(options['<template>']) if options['<template>'] else str(options['<language>'])+'.j2'

        self.template_environment = Environment(
            autoescape=False,
            loader=FileSystemLoader(THIS_DIR),
            trim_blocks=False) if options['<template>'] else Environment(
                autoescape=False,
                loader=FileSystemLoader(os.path.join(THIS_DIR, 'templates')),
                trim_blocks=False)

    def __render_template(self):
        try:
            return self.template_environment.get_template(self.template).\
                render(self.config_data)
        except Exception:
            print("Template file not found or is not a valid .j2")
            sys.exit(0)

    def create_dockerfile(self, fname='Dockerfile.test'):
        with open(fname, 'w') as f:
            dockerfile = self.__render_template()
            f.write(dockerfile)
            print(dockerfile)
