# Sentiment Analysis Kubernetes Web App
This repository contains the source files needed to run Sentiment Analysis Webapp on Kubernetes

It clones and build local docker images of following components:
1. Sentiment Analysis Frontend (React)
2. Sentiment Analysis Backend Service (Java Spring)
3. Sentiment Analysis Logic Service (Python)

## Kubernetes 
It configures following Kubernetes components to make Sentiment Analysis App works:
1. Frontend deployment
2. Backend service deployment
3. Logic service deployment
4. Frontend Loadbalancer
5. Backend Microservice Loadbalancer