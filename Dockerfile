# -------------------------
# Stage 1: Build
# -------------------------
FROM maven:3.9.0-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven files and source code
COPY pom.xml .
COPY src ./src

# Build the Spring Boot jar (skip tests for faster build)
RUN mvn clean package -DskipTests

# -------------------------
# Stage 2: Run
# -------------------------
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the jar from the build stage
COPY --from=build /app/target/admin-server-0.0.1-SNAPSHOT.jar app.jar

# Expose the port defined in application.yml
EXPOSE 8081

# Run the jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
