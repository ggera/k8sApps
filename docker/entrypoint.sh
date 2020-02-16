set -e
set -x


java $JAVA_OPTS -server -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} -jar paycheck-services-0.0.1-SNAPSHOT.jar

