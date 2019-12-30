
## Create logging resource (Sidecar)
## Note: ClusterOutput and ClusterFlow resource will only be accepted in the controlNamespace
kubectl -n demo apply -f - <<"EOF" 
apiVersion: logging.banzaicloud.io/v1beta1
kind: Logging
metadata:
  name: demo
spec:
  fluentd: {}
  fluentbit: {}
  controlNamespace: demo 
EOF

## Create an ElasticSearch output definition
## Note: For production set-up we recommend using longer timekey interval to avoid generating too many object.
kubectl -n demo apply -f - <<"EOF" 
apiVersion: logging.banzaicloud.io/v1beta1
kind: Output
metadata:
  name: demo-output
spec:
  elasticsearch:
    host: elasticsearch-es-http
    port: 9200
    scheme: https
    ssl_verify: false
    ssl_version: TLSv1_2
    user: elastic
    password:
      valueFrom:
        secretKeyRef:
          name: quickstart-es-elastic-user
          key: elastic
    buffer:
      timekey: 1m
      timekey_wait: 30s
      timekey_use_utc: true
EOF

## Create flow resource
kubectl -n logging apply -f - <<"EOF" 
apiVersion: logging.banzaicloud.io/v1beta1
kind: Flow
metadata:
  name: demo-flow
spec:
  filters:
    - tag_normaliser: {}
    - parser:
        remove_key_name_field: true
        reserve_data: true
        parse:
          type: sa-microservice
  selectors:
    app: sa-microservice
  outputRefs:
    - demo-output
EOF
