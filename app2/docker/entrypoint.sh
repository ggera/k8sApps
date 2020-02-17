set -e
set -x

java $JAVA_OPTS -server -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} -jar geralabs-app2-0.0.1-SNAPSHOT.jar

