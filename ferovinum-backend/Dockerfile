FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY target/ferovinum-backend-1.0-SNAPSHOT-jar-with-dependencies.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
