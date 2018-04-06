#!/usr/bin/env python
from cli import dockergen
import tempgen


def main():
    tg = tempgen.Tempgen(dockergen())
    tg.create_dockerfile()


if __name__=="__main__":
    main()

#print(config_data)
