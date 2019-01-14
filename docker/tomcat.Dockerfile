FROM tomcat:8.5-jre8-slim
LABEL author="xjulio@gmial.com"
LABEL version="1.0"
ADD dist/sample.war /usr/local/tomcat/webapps/sample.war
