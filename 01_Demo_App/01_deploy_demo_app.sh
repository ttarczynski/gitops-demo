#!/bin/bash

# 1. Monitor results (run in separate terminal):
watch -n 1 "kubectl get all -n demo"

# 2. Apply the manifests:
kubectl apply -f ./

# 3. See the results (demo service):
URL=$(minikube service --url -n demo demo)
kubectl get pod -n demo -Lapp/name -L app/instance -L app/version
curl $URL -s
