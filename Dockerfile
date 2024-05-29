FROM maven:3.9.3-openjdk-14 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:14-slim
COPY --from=build /target/examserver-0.0.1-SNAPSHOT.jar examserver.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","examserver.jar"]