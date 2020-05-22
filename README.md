# docker-plantuml

Docker image containing the [PlantUML](https://github.com/plantuml/plantuml)
CLI.

## Usage

You can either mount the diagrams as volume:

    docker run --rm -v $(pwd):/data plantuml my-diagram.puml

Or pass a single puml file using stdin:

    cat my-diagram.puml | docker run --rm plantuml -pipe > my-diagram.png
