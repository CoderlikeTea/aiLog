#!/bin/ksh


java -cp /app/log/app/logservice/log4j-1.0/lib/log4j-1.2.12.jar org.apache.log4j.net.SocketServer 4819 /app/log/app/logservice/log4j-1.0/config/log4j-server.properties   /app/log &
