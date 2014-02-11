FROM centos:6.4
MAINTAINER yshrsmz <the.phantom.bane@gmail.com>

#VOLUME ["/var/volume1", "/var/volume2"]

# install needed modules
RUN yum install -y gcc make git zlib zlib-devel readline readline-devel openssl openssl-devel curl curl-devel manpath

# install oracle jdk 1.7
RUN wget --no-check-certificate --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" -O jdk-linux-x64.rpm "http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.rpm"
RUN rpm -Uvh jdk-linux-x64.rpm
RUN rm jdk-linux-x64.rpm
ENV JAVA_HOME /usr/java/default

# --- configure via chef? ----------------------
# add tomcat user
#RUN useradd -s /bin/bash cy_tomcat

# install tomcat7
#RUN curl -o /tmp/tomcat.tar.gz http://http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.50/bin/apache-tomcat-7.0.50.tar.gz
#RUN cd /var/
#RUN tar -xzvf /tmp/tomcat.tar.gz
#RUN mv apache-tomcat-7.0.50 /usr/local
#RUN cd /usr/local
#RUN chown -R cy_tomcat apache-tomcat-7.0.50
#RUN ln -s apache-tomcat-7.0.50 tomcat
#ENV CATALINA_HOME=/usr/local/tomcat
# ---------------------------------------------

### 
# setup ruby
# https://github.com/yss44/docker_rails_base
###
ADD ./install_scripts/install_ruby.sh install_ruby.sh
RUN sh ./install_ruby.sh

###
# setup node
# https://github.com/yss44/docker_rails_base
###
ADD ./install_scripts/install_node.sh install_node.sh
RUN sh ./install_node.sh