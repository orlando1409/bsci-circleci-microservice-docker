FROM circleci/openjdk:11.0.1-jdk
#VOLUME /tmp
RUN mkdir -p /target/dependency/
RUN mvn clean install
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]
