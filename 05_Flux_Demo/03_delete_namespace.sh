#!/bin/bash

# 1. Monitor results (run in separate terminal):
URL=$(minikube service --url -n demo demo | sed 's/\* //');
watch -n 1 "kubectl get namespace demo; echo; kubectl get pod -n demo -Lapp/name -L app/instance -L app/version;
echo '----';
curl $URL -s"

# 2. Delete the demo namespace and observe Flux logs:
kubectl delete namespaces demo --wait=false
kubectl logs -n flux deployment/flux --since 10m --follow | egrep 'demo.+(created)'
