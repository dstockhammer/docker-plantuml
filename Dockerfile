FROM plantuml/plantuml:1.2025.9 AS plantuml
FROM eclipse-temurin:25

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
      graphviz \
      fonts-dejavu \
 && rm -rf /var/lib/apt/lists/*

COPY --from=plantuml /opt/plantuml.jar /app/plantuml.jar

WORKDIR /data

ENTRYPOINT [ "java", "-Djava.awt.headless=true", "-jar", "/app/plantuml.jar" ]
CMD [ "-help" ]
