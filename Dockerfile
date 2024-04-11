# Stage 1: Build the application
FROM maven:3.8.4-jdk-11 AS build

# Set the working directory in the container
WORKDIR /build

# Copy the source code into the container
COPY . .

# Change directory to where the pom.xml is located
WORKDIR /build/myapp

# Build the application
RUN mvn clean package

# Stage 2: Create the runtime image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Define a build argument
ARG NEW_VERSION

# Copy the compiled JAR file from the build stage into the runtime image
COPY --from=build /build/myapp/target/myapp-$NEW_VERSION.jar /app/myapp.jar

# Run the application when the container launches
CMD ["java", "-jar", "myapp.jar"]
