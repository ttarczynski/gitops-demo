#!/bin/bash

# 1. Monitor results (run in separate terminal):
watch -n 1 "kubectl get all -n demo"

# 2. Copy manifests to /manifests dir
rsync -av ../01_Demo_App/*.yaml ../manifests/01_Demo_App/

# 3. Commit the changes to GIT:
git add ../manifests/01_Demo_App/
git commit --message="Add Demo App to GitOps manifests"

# 4. Push to github and observe Flux logs:
git push origin master
kubectl logs -n flux deployment/flux --since 10m --follow | egrep '\\n.+demo.+(created|configured)'
