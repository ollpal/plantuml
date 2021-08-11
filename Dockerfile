FROM openjdk:14-jdk-alpine3.10

ARG VERSION

ENV LANG en_US.UTF-8

RUN echo "<$VERSION>"
RUN echo "<$LANG>"

RUN apk add --no-cache graphviz wget ca-certificates ttf-dejavu fontconfig \
  && wget "https://sourceforge.net/projects/plantuml/files/$VERSION/plantuml.$VERSION.jar/download" -O plantuml.jar \
  && apk del wget ca-certificates

RUN ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-version"]
RUN ["dot", "-version"]

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-p"]
CMD ["-tsvg"]
