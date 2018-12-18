#!/bin/bash
./gradlew check sonarqube -Dsonar.login=$SONARQUBE_TOKEN
