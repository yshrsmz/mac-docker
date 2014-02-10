FROM centos:6.4
MAINTAINER yshrsmz <the.phantom.bane@gmail.com>

#VOLUME ["/var/volume1", "/var/volume2"]

# install gcc, make, git
RUN yum install -y gcc make git

# install oracle jdk 1.7
RUN wget --no-check-certificate --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" -O jdk-linux-x64.rpm "http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.rpm"
RUN rpm -Uvh jdk-linux-x64.rpm
RUN rm jdk-linux-x64.rpm
ENV JAVA_HOME /usr/java/default

# --- configure via chef ----------------------
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
# should use this? https://github.com/yss44/docker_rails_base
###
RUN mkdir ~/.rbenv

# setup rbenv
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
ENV PATH=$HOME/.rbenv/bin:$PATH
ENV RBENV_DIR=$HOME/.rbenv/bin
ENV RBENV_ROOT=$HOME/.rbenv
RUN eval "$(rbenv init -)"

# setup ruby-build
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# set ruby
RUN rbenv install --list
RUN rbenv install -v 1.9.3p448
RUN rbenv rehash
RUN rbenv versions
RUN rbenv global 1.9.3p448
