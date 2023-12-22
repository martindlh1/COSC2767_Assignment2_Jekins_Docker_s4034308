#create a docker image from Dockerfile
docker build -t tomcat-image .

#create a container from the previous image created
docker run -d --name tomcat-container -p 8081:8080 tomcat-image
