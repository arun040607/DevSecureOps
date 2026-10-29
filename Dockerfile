# Multi-stage build: compile with Maven, run with a smaller JRE image
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /workspace
COPY pom.xml .
COPY src ./src
RUN mvn -B clean package

FROM eclipse-temurin:17-jre
WORKDIR /app
RUN useradd --system --uid 10001 appuser
COPY --from=build /workspace/target/devsecureops-1.0.0.jar app.jar
USER 10001
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s --start-period=25s --retries=3 CMD ["sh", "-c", "java -version >/dev/null 2>&1"]
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
