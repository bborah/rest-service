FROM openjdk:8
EXPOSE 7000
ADD /target/rest-service-0.0.1-SNAPSHOT.jar rest-service-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/rest-service-0.0.1-SNAPSHOT.jar"]