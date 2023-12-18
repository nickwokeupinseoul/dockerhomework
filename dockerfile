FROM ubuntu:18.04
RUN apt update
RUN apt install mvn -y
RUN apt install tomcat9 -y
RUN apt install jdk -y
RUN apt install git -y
ENV HOME=/app
WORKDIR $HOME
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd ./boxfuse-sample-java-war-hello && mvn package && cd ./target
RUN cp ./hello-1.0.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]