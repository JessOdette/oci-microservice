FROM openjdk:17-jdk-slim
WORKDIR /oci-microservice-a01643724
COPY /target/*.jar oci-microservice-a01643724.jar
COPY /src/main/resources/Wallet_javadev /oci-microservice-a01643724/Wallet_javadev
ENV TNS_ADMIN=/oci-microservice-a01643724/Wallet_javadev
EXPOSE 8081
ENTRYPOINT [ "java", "-Doracle.net.tns_admin=/oci-microservice-a01643724/Wallet_javadev", "-jar", "oci-microservice-a01643724.jar" ]