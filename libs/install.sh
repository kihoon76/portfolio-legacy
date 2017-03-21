#! /bin/bash
mvn install:install-file -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2.0 -Dpackaging=jar -Dfile=ojdbc7.jar
mvn install:install-file -DgroupId=com.oracle -DartifactId=mysql-connector -Dversion=5.1.40 -Dpackaging=jar -Dfile=mysql-connector-java-5.1.40-bin.jar 