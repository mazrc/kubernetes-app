
## Builds docker images for sentiment analysis front end app, backend service and logic service

## Sentiment Analysis Frontend Image [React App]
git clone https://github.com/mazrc/sent-webapp.git
cd sent-webapp
npm install
npm build
docker image rm objex/sentiment-service --force ## cleanup last image
docker build . -f Dockerfile -t objex/sentiment-analysis-frontend ## build new image
cd ..

## Backend Service Image [Java Spring]
git clone https://github.com/mazrc/sent-microservice.git
cd sent-microservice
mvn clean install
docker build . -f Dockerfile -t objex/sentiment-service
# docker push objex/sentiment-service ## Optional
cd ..

## Logic Service Image [Python]
https://github.com/mazrc/sent-python-service.git
cd sent-python-service
docker build . -f Dockerfile -t objex/sentiment-logic
cd ..

echo "images created !!"