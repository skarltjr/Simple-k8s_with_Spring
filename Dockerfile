FROM adoptopenjdk:11-jre-hotspot
# jdk 11 이미지 내 home/spring 없으면 만들어서 이동하고
WORKDIR /home/spring
# /home/spring/application.jar에 jar를 복사하여
COPY src/main/jar/*.jar /home/spring/application.jar
VOLUME /tmp
EXPOSE 8080
# 실행
ENTRYPOINT ["java", "-jar", "/home/spring/application.jar"]
