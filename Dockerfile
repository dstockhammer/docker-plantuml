FROM maven:3-eclipse-temurin-22 as plantuml
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:copy-dependencies


FROM eclipse-temurin:21

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
      graphviz \
      fonts-dejavu \
 && rm -rf /var/lib/apt/lists/*

COPY --from=plantuml /app/target/dependency/plantuml-*.jar /app/plantuml.jar

WORKDIR /data

ENTRYPOINT [ "java", "-Djava.awt.headless=true", "-jar", "/app/plantuml.jar" ]
CMD [ "-help" ]
