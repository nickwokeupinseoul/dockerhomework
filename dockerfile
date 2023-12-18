FROM ubuntu:18.04
RUN apt update
RUN apt install maven -y
RUN apt install openjdk-11-jdk -y
RUN apt install git -y
WORKDIR /opt
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR /opt/boxfuse-sample-java-war-hello/
RUN mvn package
FROM tomcat
RUN cp /opt/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
