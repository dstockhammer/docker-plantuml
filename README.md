# docker-plantuml

Docker image containing the [PlantUML](https://github.com/plantuml/plantuml)
CLI.

[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/dstockhammer/plantuml?sort=semver)](https://hub.docker.com/r/dstockhammer/plantuml)
[![GitHub last commit](https://img.shields.io/github/last-commit/dstockhammer/docker-plantuml)](https://github.com/dstockhammer/docker-plantuml/commits/master)

## Usage

You can either mount the diagrams as volume:

    docker run --rm -v $(pwd):/data dstockhammer/plantuml my-diagram.puml

Or pass a single puml file using stdin:

    cat my-diagram.puml | docker run --rm -i dstockhammer/plantuml -pipe > my-diagram.png

Alternatively, you can copy the [plantuml.sh](plantuml.sh) script to a location
on your system and execute that. For convenience, here's a script that downloads
the script and puts it into `/usr/local/bin` so that you can simply execute
`plantuml` as if it was installed natively:

    curl -sL https://raw.githubusercontent.com/dstockhammer/docker-plantuml/master/plantuml.sh > plantuml.sh
    sudo mv plantuml.sh /usr/local/bin/plantuml
    sudo chmod +x /usr/local/bin/plantuml
    plantuml

Note: PlantUML has a history of frequent backward-incompatible changes, so to be
safe make sure to replace `latest` in the script above with a version of choice.
