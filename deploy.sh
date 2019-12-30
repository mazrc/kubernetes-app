## deploy app to kubernetes
cd k8

## delete existing deployments
kubectl delete namespace demo

## Create namespace
kubectl apply -f - <<"EOF"
kind: Namespace
apiVersion: v1
metadata:
  name: demo
  labels:
    name: sentiment-analysis-demo
EOF


## Frontend
kubectl apply -f sa-frontend-deployment.yaml --namespace=demo
kubectl apply -f service-sa-frontend-lb.yaml --namespace=demo

## Backend Service
kubectl apply -f sa-service-deployment.yaml --namespace=demo
kubectl apply -f service-sa-microservice-lb.yaml --namespace=demo

## Logic Service
kubectl apply -f sa-logic-deployment.yaml --namespace=demo
kubectl apply -f service-sa-logic.yaml --namespace=demo

## Load balancers
kubectl apply -f service-sa-microservice-lb.yaml --namespace=demo
kubectl apply -f service-sa-frontend-lb.yaml --namespace=demo

## List all pods
kubectl get pods -n demo