#!/bin/bash
./gradlew :backend-server:buildImage
id=`docker run -d -l biking-forecase-local-dev -p 8080:8080 -i -t biking-forecast-backend-server:latest`
echo ""
echo "Ctrl+C to shutdown"
echo ""
sleep 2
start "" "http://localhost:8080/first"
docker container attach $id
docker container prune -f --filter "label=biking-forecase-local-dev"