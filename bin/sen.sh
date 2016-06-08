#!/bin/sh
# This line added since original to replace global definition for SEN_HOME.
SEN_HOME=/usr/local/sen
# set classpath
CLASSPATH=${SEN_HOME}/lib/sen.jar
CLASSPATH=${CLASSPATH}:${SEN_HOME}/lib/commons-logging.jar

java -Dorg.apache.commons.logging.simplelog.log.net.java=info \
     -Dorg.apache.commons.logging.Log=org.apache.commons.logging.impl.SimpleLog  \
     -Dsen.home=${SEN_HOME} \
     -classpath ${CLASSPATH} \
     StringTaggerDemo ${1+"$@"}



