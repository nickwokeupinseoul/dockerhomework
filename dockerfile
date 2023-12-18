FROM ubuntu:18.04
RUN apt update
RUN apt install maven -y
RUN apt install openjdk-11-jdk -y
RUN apt install git -y
RUN apt install wget -y
WORKDIR /opt
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR /opt/boxfuse-sample-java-war-hello/
RUN mvn package
RUN mkdir /usr/local/tomcat
RUN wget  https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.97/bin/apache-tomcat-8.5.97.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.97/* /usr/local/tomcat/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
RUN cp /opt/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps