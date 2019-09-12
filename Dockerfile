FROM openjdk:8-jdk-alpine
##VOLUME /tmp
RUN ls
RUN mkdir -p /target/dependency/
RUN ls ./target/dependency
COPY target/dependency ./target/dependency
RUN ls ./target/dependency
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]



