FROM centos:6.4
MAINTAINER yshrsmz <the.phantom.bane@gmail.com>

#VOLUME ["/var/volume1", "/var/volume2"]

# install git
RUN yum install -y git

# install oracle jdk 1.7
RUN wget --no-check-certificate --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" -O jdk-linux-x64.rpm "http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.rpm"
RUN rpm -Uvh jdk-linux-x64.rpm
RUN rm jdk-linux-x64.rpm
ENV JAVA_HOME /usr/java/default
