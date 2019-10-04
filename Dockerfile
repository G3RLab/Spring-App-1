RUN echo 'Processing Dockerfile...'
#
# The FROM keyword defines the base Docker image of our container.
# OpenJDK installed on Alpine Linux which is chosen which is a lightweight Linux distribution.
FROM openjdk:8u111-jdk-alpine

# The VOLUME instruction creates a mount point with the specified name and marks it
# as holding externally mounted volumes from the native host or other containers.
VOLUME /tmp

# ADD copies the executable JAR generated during the build to the container root directory
ADD /target/Spring-App-1-0.0.1-SNAPSHOT.jar app.jar

# ENTRYPOINT defines the command to execute when the container is started. Since Spring Boot produces an executable JAR with
# embedded Tomcat, the command to execute is simply java -jar app.jar.
# The additional flag java.security.edg=file:/dev/./urandom is used to speed up the application start-up and avoid possible freezes.
# By default, Java uses /dev/random to seed its SecureRandom class which is known to block if its entropy pool is empty.
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

RUN echo 'Dockerfile processed.'