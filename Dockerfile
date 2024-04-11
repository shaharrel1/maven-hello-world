# Use a base image
FROM openjdk:7-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the compiled JAR file from the host into the container at /app
COPY myapp/target/myapp-$NEW_VERSION.jar /app/myapp.jar

# Run the application when the container launches
CMD ["java", "-jar", "myapp.jar"]
