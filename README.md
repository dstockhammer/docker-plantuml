# docker-plantuml

Docker image containing the [PlantUML](https://github.com/plantuml/plantuml)
CLI.

## Usage

You can either mount the diagrams as volume:

    docker run --rm -v $(pwd):/data dstockhammer/plantuml my-diagram.puml

Or pass a single puml file using stdin:

    cat my-diagram.puml | docker run --rm dstockhammer/plantuml -pipe > my-diagram.png

Alternatively, you can copy the [plantuml.sh](plantuml.sh) script to a location
on your system and execute that. For convenience, here's a script that downloads
the script and puts it into `/usr/local/bin` so that you can simply execute
`plantuml` as if it was installed natively:

    curl -sL https://raw.githubusercontent.com/dstockhammer/docker-plantuml/master/plantuml.sh > plantuml.sh
    sudo mv plantuml.sh /usr/local/bin/plantuml
    sudo chmod +x /usr/local/bin/plantuml
    plantuml
