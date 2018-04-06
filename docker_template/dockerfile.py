#!/usr/bin/env python

import os
from jinja2 import Environment, FileSystemLoader

THIS_DIR = os.path.dirname(os.path.abspath(__file__))

TEMPLATE_ENVIRONMENT = Environment(
    autoescape=False,
    loader=FileSystemLoader(os.path.join(THIS_DIR)),
    trim_blocks=False)

def render_template(template_filename, context):
    return TEMPLATE_ENVIRONMENT.get_template(template_filename).render(context)

def create_dockerfile():
    fname = 'Dockerfile'
    context = {
        'WORKDIR' : '/app',
        'APPNAME' : 'go.app',
        'BUILDCOMMAND' : 'CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .',
        'PACKAGES' : 'ca-certificates',
        'COMMAND' : './app'
    }
    with open(fname, 'w') as f:
        dockerfile = render_template('Dockerfile.j2', context)
        f.write(dockerfile)

def main():
    create_dockerfile()

if __name__=="__main__":
    main()
