#!/bin/bash
set -e
function cleanup {
	echo ""
    echo "------------------------------------------"
	echo "Killing container"
    echo "------------------------------------------"
    docker container kill $id
	echo ""
    echo "------------------------------------------"
	echo "Removing container"
    echo "------------------------------------------"
	docker container rm $id
}
trap cleanup EXIT
echo "------------------------------------------"
echo "Building application & Docker image"
echo "------------------------------------------"
./gradlew :backend-server:buildImage --console=plain # because 'rich' jacks up later echos on Cmder:bash 
echo ""
echo "------------------------------------------"
echo "Starting application via Docker image"
echo "------------------------------------------"
echo "App should open in browser tab momentarily"
echo "App logs should show below"
echo "Ctrl+c to kill and remove container"
echo ""
id=`docker run -d -l biking-forecase-local-dev -p 8080:8080 -i -t biking-forecast-backend-server:latest`
(sleep 5; start "" "http://localhost:8080/first") &
docker container attach $id