FROM openjdk:8
EXPOSE 7000
ADD /target/spring-aks-test.jar spring-aks-test.jar
ENTRYPOINT ["java", "-jar", "/spring-aks-test.jar"]