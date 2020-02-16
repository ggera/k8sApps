FROM openjdk:8-jre-alpine

MAINTAINER Paga DevOps "paga-devops@apposit.com"

RUN rm -rf /var/cache/apk/*

ENV JAVA_OPTS $JAVA_OPTS \
    -XX:CompileCommand=exclude,org/apache/velocity/runtime/directive/Foreach,render \
    -Dsun.net.inetaddr.ttl=30 \
    -XX:+UseParallelOldGC \
    -XX:ParallelGCThreads=8

ENV SPRING_PROFILES_ACTIVE qa2
ENV DB_URL="jdbc:sqlserver://pagadbserver:1433;"
ENV DB_USER=paga
ENV DB_PASSWORD=paga

RUN mkdir /usr/share/data-streams
RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2
WORKDIR /usr/share/paycheck
COPY target/paycheck-services-0.0.1-SNAPSHOT.jar paycheck-services-0.0.1-SNAPSHOT.jar
COPY entrypoint.sh entrypoint.sh

CMD ["sh", "-c", "/usr/share/paycheck/entrypoint.sh"]