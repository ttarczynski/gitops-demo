#!/bin/bash

# 1. Monitor results (run in separate terminal):
  URL=$(minikube service --url -n demo demo); watch -n 1 "kubectl get namespace demo; echo; kubectl get pod -Lapp/name -L app/instance -L app/version; echo; curl $URL -s"

# 2. Remove manifests from GIT:
  rm -rf ../manifests/01_Demo_App/
  git diff --stat

# 3. Commit the changes to GIT:
  git add ../manifests/
  git commit --message="Remove demo app from /manifests"

# 4. Push to github and observe Flux logs:
  git push origin master
  kubectl logs -n flux deployment/flux --since 10m --follow | egrep demo

# 5. Remove the demo namespace
  kubectl delete namespaces demo --wait=false
