FROM jdk-11.0.11_9-alpine-slim as builder

COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src

RUN chmod +x ./gradlew
RUN ./gradlew bootjar

FROM jdk-11.0.11_9-alpine-slim

COPY --from=builder build/libs/*.jar demo-0.0.1-SNAPSHOT.jar
VOLUME /tmp
EXPOSE 8080


ENTRYPOINT ["java", "-jar", "/demo-0.0.1-SNAPSHOT.jar"]
