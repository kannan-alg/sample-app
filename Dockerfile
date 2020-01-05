#FROM maven:3.5.3-jdk-8

#RUN mkdir /kanna && apt-get install -y git
#WORKDIR /kanna
#RUN rm -rf *
#RUN git clone https://github.com/suresh-devops/sample-app.git


# FROM maven:3.5.3-jdk-8
# RUN mkdir /maven
# WORKDIR /maven


FROM tomcat:latest
COPY target/*.war /usr/local/tomcat/webapps/app.war
