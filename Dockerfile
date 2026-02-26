FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=build /app/target/train-ticket-app-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

# To test in local
# docker run -p 8080:8080 app-name 
# run this command at the location where the above file is present
# The port mapping provided in this command 8080 is the exposed port and 
# the 8080 after colon refers to the localhost port where this will be exposed in local
