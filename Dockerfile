FROM openjdk:21-slim
COPY build/libs/structured-logging-micronaut-0.4-all.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]