FROM alpine/git:v2.26.2 AS GET

ARG VERSION

WORKDIR /source

COPY ./ ./

RUN /bin/sh ./scripts/git_source.sh

FROM maven:3.6.3-adoptopenjdk-8

WORKDIR /source

COPY --from=GET /source/Sentinel/sentinel-dashboard /source

COPY ./scripts/build.sh ./

RUN /bin/sh ./build.sh


FROM maven:3.6.3-adoptopenjdk-8 AS BUILD

WORKDIR /source

COPY --from=GET /source/Sentinel/sentinel-dashboard /source

COPY ./scripts/build.sh ./

RUN /bin/sh ./build.sh

FROM adoptopenjdk:8u262-b10-jdk-hotspot

WORKDIR /app

COPY --from=BUILD /source/target/sentinel-dashboard.jar /app/sentinel-dashboard.jar

COPY ./scripts/start.sh ./

CMD [ "/bin/sh", "-c", "/app/start.sh"]
