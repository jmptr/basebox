cd /code
mvn clean install
mvn clean install -P buildCore
mvn clean install -P buildSecurity
mvn clean install -P deployCore,deploySecurity
