#create image if not existing
docker image inspect tomcat-image
if [ $? -eq 1 ]
then
    rm Dockerfile
    echo "FROM tomcat:latest" >> Dockerfile
    echo "RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps" >> Dockerfile
    echo "COPY ./*.war /usr/local/tomcat/webapps" >> Dockerfile
    docker build -t tomcat-image .
fi
  

#remove container if existing
docker stop tomcat-container
docker rm tomcat-container

#create a container from the previous image created
docker run -d --name tomcat-container -p 8081:8080 tomcat-image
