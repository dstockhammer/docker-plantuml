#!/usr/bin/env bash
docker run --rm -i -v $(pwd):/data dstockhammer/plantuml:latest $@
