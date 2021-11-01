FROM openjdk:8-jdk-alpine as builder

COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src

RUN chmod +x ./gradlew
RUN ./gradlew bootjar

FROM openjdk:8-jdk-alpine

COPY --from=builder build/libs/*.jar demo-0.0.1-SNAPSHOT.jar
VOLUME /tmp
EXPOSE 8080


ENTRYPOINT ["java", "-jar", "/demo-0.0.1-SNAPSHOT.jar"]
