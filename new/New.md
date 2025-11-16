1. FROM 
2. MAINTAINER
3. RUN
4. CMD
5. ENTRYPOINT
6. USER
7. COPY
8. ADD
9. WORKDIR
10. EXPOSE
11. ARG
12. VOLUME
etc...
-------------------------------
FROM keyword
from keyword is used to specify the base image to create our own docker image
FROM ubuntu:<version name>
FROM ubuntu
FROM python:3.6
FROM tomcat:8.0
-------------------------------
MAINTAINER
MAINTAINER keyword is used to specify the author of the Dockerfile
-------------------------------
RUN
RUN touch file1.txt
RUN touch file2.txt
We can write multiple RUN instructions and these instruction will executed in same order.
Run keywordis used to specify instructions to execute when the docker image is creation...
------------------------------
CMD Keyword
CMD keyword is used to specify instructions to execute when the docker container is creating ...

to start a react app
CMD "Java -jar amazon-app.jar"
CMD "npm start" => React App
------------------------------
COPY command
It is used to copy the files from host machine to container machine

COPY target/amazon-app.war /usr/app/
COPY <local path> <container path>
COPY pythonapp.py /usr/app/
------------------------------
ADD command
It is used to copy the files from host machine as well as from internet to container
same like COPY but with local we can give url or github url

ADD target/amazon-app.war /usr/app/
ADD <local path> <container path>
ADD pythonapp.py /usr/app/
ADD <URL> /usr/app/
------------------------------
It is used to specify the working directory location to process further docker instructions
WORKDIR /usr/app
------------------------------
EXPOSE
It is used to specify on which port number our application is listening inside a container
EXPOSE 3000
------------------------------
ENTRYPOINT
it is used to run our application code in docker container
ENTRYPOINT ["java","-jar","amazon-app.jar"]
------------------------------
USER keyword

It is used to specify the USER account to execute the dockerfile instructions 
USER root
USER ram
------------------------------
ARG keyword

It is used to pass dynamic values 
ex:
ARG branch-name
-----------------------------
VOLUME keyword
It is used to specify DOCKER volume for storing the data 
VOLUME <volume-name>


