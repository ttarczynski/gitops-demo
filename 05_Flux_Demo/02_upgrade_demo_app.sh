#!/bin/bash

# 1. Monitor results (run in separate terminal):
watch -n 1 "kubectl get pod -Lapp/name -L app/instance -L app/version; echo; curl http://192.168.99.106:30831 --silent"

# 2. Change manifests:
sed -i 's/1.10/1.11/g' ../manifests/01_Demo_App/*
git diff

# 3. Commit the changes to GIT:
git add ../manifests/01_Demo_App/
git commit --message="Upgrade demo app to v1.11"

# 4. Push to github and observe Flux logs:
git push origin master
kubectl logs -n flux deployment/flux --since 10m --follow | egrep demo
