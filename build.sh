
## Builds docker images for app, proxy and service

## Frontend Image [React App]
cd sent-webapp
npm install
npm build

## cleanup last image
docker image rm objex/sentiment-service --force
## build new image
docker build . -f Dockerfile -t objex/sentiment-analysis-frontend
cd ..

## Service Image [Java Spring]
cd sent-java-service
mvn clean install
docker build . -f Dockerfile -t objex/sentiment-service
docker push objex/sentiment-service
cd ..

## Logic Service Image [Python]
cd sent-python-service
docker build . -f Dockerfile -t objex/sentiment-logic
cd ..

