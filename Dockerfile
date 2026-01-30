FROM openjdk:26-ea-trixie
EXPOSE 8080
ADD target/spring-boot-hello-world-lolc.jar spring-boot-hello-world-lolc.jar
ENTRYPOINT ["java", "-jar", "/spring-boot-hello-world-lolc.jar"]
