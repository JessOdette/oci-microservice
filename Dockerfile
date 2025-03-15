FROM openjdk:17-jdk-slim
WORKDIR /oci-microservice-a01643724
COPY /target/*.jar oci-microservice-a01643724.jar
COPY /src/main/resources/Wallet_javadev /oci-microservice-a01643724/Wallet_javadev

# Create ojdbc.properties for more reliable wallet location
RUN echo "oracle.net.wallet_location=(/oci-microservice-a01643724/Wallet_javadev)" > /oci-microservice-a01643724/ojdbc.properties

# Set environment variables
ENV TNS_ADMIN=/oci-microservice-a01643724/Wallet_javadev
ENV PATH=$PATH:/oci-microservice-a01643724/Wallet_javadev

# Display file contents for debugging
RUN ls -la /oci-microservice-a01643724/Wallet_javadev/
RUN cat /oci-microservice-a01643724/Wallet_javadev/tnsnames.ora

EXPOSE 8081
ENTRYPOINT ["java", "-Doracle.net.wallet_location=/oci-microservice-a01643724/Wallet_javadev", "-Doracle.net.tns_admin=/oci-microservice-a01643724/Wallet_javadev", "-jar", "oci-microservice-a01643724.jar"]