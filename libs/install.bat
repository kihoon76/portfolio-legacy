cd ../
mvnw install:install-file -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2.0 -Dpackaging=jar -Dfile=libs/ojdbc7.jar && ^
mvnw install:install-file -DgroupId=com.oracle -DartifactId=mysql-connector -Dversion=5.1.40 -Dpackaging=jar -Dfile=libs/mysql-connector-java-5.1.40-bin.jar
