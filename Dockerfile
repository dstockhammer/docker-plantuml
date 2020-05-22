FROM alpine AS plantuml

ARG version

RUN apk add --no-cache \
  wget

RUN wget \
  "https://sourceforge.net/projects/plantuml/files/$version/plantuml.$version.jar/download" \
  -O /plantuml.jar

FROM openjdk:15-alpine

RUN apk add --no-cache \
  graphviz \
  ttf-dejavu

COPY --from=plantuml /plantuml.jar /app/plantuml.jar

WORKDIR /data

ENTRYPOINT [ "java", "-Djava.awt.headless=true", "-jar", "/app/plantuml.jar" ]
CMD [ "-help" ]
