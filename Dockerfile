FROM openjdk:14-jdk-alpine3.10

ARG VERSION
ARG GRAPHVIZ_VERSION=2.48.0

ENV LANG en_US.UTF-8

RUN echo "<$VERSION>"
RUN echo "<$LANG>"


RUN apk add --no-cache g++ make expat-dev wget ca-certificates ttf-dejavu fontconfig \
  && wget https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/$GRAPHVIZ_VERSION/graphviz-$GRAPHVIZ_VERSION.tar.gz -O graphviz.tar.gz\
    && tar -xzf graphviz.tar.gz \
    && cd graphviz-$GRAPHVIZ_VERSION \
    && ./configure && make && make install \
    && cd .. \
    && rm graphviz.tar.gz \
    && rm -rf graphviz-$GRAPHVIZ_VERSION \
  && wget "https://sourceforge.net/projects/plantuml/files/$VERSION/plantuml.$VERSION.jar/download" -O plantuml.jar \
  && apk del wget ca-certificates g++ gcc make

RUN ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-version"]
RUN ["dot", "-version"]

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar"]
CMD ["-p", "-tsvg"]
