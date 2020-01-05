#! /bin/bash -e

VERSION=$(cat pom.xml | grep "<version>" | head -1 | awk '{print $1}' | sed "s/<version>//" | sed "s/<.*//")
docker build -t devopsmptech/application:$VERSION .
docker login -u devopsmptech -p "${DOCKER_PASSWORD}"
docker push devopsmptech/application:$VERSION
ssh -i /var/lib/jenkins/new.pem -o StrictHostKeyChecking=no ec2-user@172.31.82.35 docker login -u devopsmptech -p "${DOCKER_PASSWORD}"
ssh -i /var/lib/jenkins/new.pem -o StrictHostKeyChecking=no ec2-user@172.31.82.35  docker rm -f app1 || true
ssh -i /var/lib/jenkins/new.pem -o StrictHostKeyChecking=no ec2-user@172.31.82.35  docker rm -f app2 || true
ssh -i /var/lib/jenkins/new.pem -o StrictHostKeyChecking=no ec2-user@172.31.82.35  docker rm -f app3 || true
ssh -i /var/lib/jenkins/new.pem -o StrictHostKeyChecking=no ec2-user@172.31.82.35  docker rm -f app4 || true
ssh -i /var/lib/jenkins/new.pem -o StrictHostKeyChecking=no ec2-user@172.31.82.35  docker rm -f app5 || true
ssh -i /var/lib/jenkins/new.pem -o StrictHostKeyChecking=no ec2-user@172.31.82.35  docker run -d --name app1 -p 8081:8080 devopsmptech/application:$VERSION
ssh -i /var/lib/jenkins/new.pem -o StrictHostKeyChecking=no ec2-user@172.31.82.35  docker run -d --name app2 -p 8082:8080 devopsmptech/application:$VERSION
ssh -i /var/lib/jenkins/new.pem -o StrictHostKeyChecking=no ec2-user@172.31.82.35  docker run -d --name app3 -p 8083:8080 devopsmptech/application:$VERSION
ssh -i /var/lib/jenkins/new.pem -o StrictHostKeyChecking=no ec2-user@172.31.82.35  docker run -d --name app4 -p 8084:8080 devopsmptech/application:$VERSION
ssh -i /var/lib/jenkins/new.pem -o StrictHostKeyChecking=no ec2-user@172.31.82.35  docker run -d --name app5 -p 8085:8080 devopsmptech/application:$VERSION
