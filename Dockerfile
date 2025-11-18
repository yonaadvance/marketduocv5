# Etapa 1: Construcción (Build)
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
# Empaquetamos el jar saltando los tests para ir más rápido
RUN mvn clean package -DskipTests

# Etapa 2: Ejecución (Run)
FROM openjdk:17-jdk-slim
COPY --from=build /app/target/marketduoc-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]