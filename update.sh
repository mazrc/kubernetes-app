
## Rolling Update
kubectl apply -f - <<"EOF" 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sa-microservice
  labels:
    app: sa-microservice
spec:
  selector:
    matchLabels:
      app: sa-microservice
  replicas: 2
  minReadySeconds: 15
  strategy:
    type: RollingUpdate
    rollingUpdate: 
      maxUnavailable: 1
      maxSurge: 1 
  template:
    metadata:
      labels:
        app: sa-microservice
    spec:
      containers:
      - image: objex/sentiment-service
        imagePullPolicy: Always
        name: sa-microservice
        env:
          - name: SA_LOGIC_API_URL
            value: "http://sa-logic"
        ports:
          - containerPort: 8080
EOF
