#!/bin/bash
echo "------------------------------------------"
echo "Ctrl+c (or MacOs equiv) to stop"
echo "App should open in browser tab momentarily"
echo "------------------------------------------"
echo ""
(sleep 5; start "" "http://localhost:8080/first" ) | ./gradlew :backend-server:run
