FROM ubuntu:18.04
RUN apt update
RUN apt install maven -y
RUN apt install tomcat9 -y
RUN apt install openjdk-11-jdk -y
RUN apt install git -y
RUN cd /opt
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd /opt/boxfuse-sample-java-war-hello && mvn package
RUN cp /opt/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]