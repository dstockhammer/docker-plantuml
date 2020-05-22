#!/usr/bin/env bash
docker run --rm -v $(pwd):/data dstockhammer/plantuml:latest $@
