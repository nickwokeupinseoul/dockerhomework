FROM ubuntu:18.04
RUN apt update
RUN apt install maven -y
RUN apt install tomcat9 -y
RUN apt install openjdk-11-jdk -y
RUN apt install git -y
RUN cd /opt
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
EXPOSE 8080
CMD /usr/share/tomcat9/bin/catalina.sh run