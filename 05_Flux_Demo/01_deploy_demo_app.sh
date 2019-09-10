#!/bin/bash

# 1. Show Flux deployment
  kubectl get deployments -n flux flux

# 2. Monitor results (run in separate terminal):
  watch -n 1 "kubectl get deployment,pod,service,configmap -n demo"

# 3. Copy manifests to /manifests dir
  rsync -av ../01_Demo_App/*.yaml ../manifests/01_Demo_App/

# 4. Commit the changes to GIT:
  git add ../manifests/01_Demo_App/
  git commit --message="Add Demo App to GitOps manifests"

# 5. Push to github and observe Flux logs:
  git push origin master
  kubectl logs -n flux deployment/flux --since 10m --follow | egrep 'output=".+demo.+(created|configured).*"'
