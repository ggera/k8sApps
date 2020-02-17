FROM openjdk:8-jre-alpine

MAINTAINER Gerawork A "gerawork.aynekulu@gmail.com"

RUN rm -rf /var/cache/apk/*

ENV JAVA_OPTS $JAVA_OPTS \
    -XX:CompileCommand=exclude,org/apache/velocity/runtime/directive/Foreach,render \
    -Dsun.net.inetaddr.ttl=30 \
    -XX:+UseParallelOldGC \
    -XX:ParallelGCThreads=8

ENV SPRING_PROFILES_ACTIVE dev

RUN mkdir /usr/share/geralabs
WORKDIR /usr/share/geralabs
COPY target/geralabs-app2-0.0.1-SNAPSHOT.jar geralabs-app2-0.0.1-SNAPSHOT.jar
COPY entrypoint.sh entrypoint.sh

CMD ["sh", "-c", "/usr/share/geralabs/entrypoint.sh"]