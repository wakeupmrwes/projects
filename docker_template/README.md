### Dockerfile Generator

This script generates Dockerfiles using the Jinja2 file templating system.


##### Usage

```
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
```

##### Templates

Jinja2 templates are kept inside of the templates folder in the repo. The attributes for each template file are contained within dockerfile.yml so that they can be easily maintained and updated by source control.

##### Dockerized Instructions

Build the image with the following command:

`docker build -t dockergen .`

```
Usage:
    docker run -v $(PWD):/app dockergen  (<language> | -t <template> -c <config_file>)

Arguments:
    <language>              Choose a language from one of the default templates.
    <template>              Custom template file in .j2 format. Must specify config file.
    <config_file>           Custom config file in .yml format. Must specify template file.

Options:
    -c, --config            Custom config file in .yml format. Must also specify template file.
    -t, --template          Custom template file in .j2 format. Must also specify config file.
    -h, --help              Show help.
    -v, --version           Show version.
```
