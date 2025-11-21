# 1. 베이스 이미지로 OpenJDK 8 Alpine 버전을 사용합니다.
# Alpine Linux 기반 이미지는 크기가 작아 효율적입니다.
FROM openjdk:8-jdk-alpine

# 2. JAR 파일이 위치할 경로를 지정합니다.
# buildspec에서 `mvn clean package` 실행 후 target/*.jar 형태로 파일이 생성됩니다.
ARG JAR_FILE=target/*.jar

# 3. 빌드된 JAR 파일을 컨테이너 내부로 복사하고 이름을 app.jar로 변경합니다.
COPY ${JAR_FILE} app.jar

# 4. 애플리케이션 실행 명령어입니다.
ENTRYPOINT ["java","-jar","/app.jar"]