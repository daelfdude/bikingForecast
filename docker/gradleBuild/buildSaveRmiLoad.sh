#!/bin/bash
echo "Build image..."
../../gradlew buildImage
docker images
echo ""
echo "Run image..."
docker run gradle-built-image
echo ""
echo "Export image..."
docker save gradle-built-image > gbi.tar
ls -l gbi.tar
echo ""
echo "Remove image..."
docker rmi gradle-built-image
docker images
echo ""
echo "Load image..."
docker load -i gbi.tar
docker images
echo ""
echo "Cleanup ..."
docker rmi gradle-built-image
docker images
rm gbi.tar
