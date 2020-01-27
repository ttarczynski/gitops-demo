#!/bin/bash

# 1. Monitor results (run in separate terminal):
  URL="http://$(minikube ip):30080";
  watch -n 1 "kubectl get pod -n demo -Lapp/name -L app/instance -L app/version;
  echo '----';
  set -x;
  curl $URL -s"

# 2. Copy namespace and HelmRelease to /manifests
  rm ../manifests/02_helm_release.yaml
  git status

# 3. Commit the changes to GIT:
  git add ../manifests/
  git commit --message="Delete the demo app release"

# 4. Push to github and observe Flux logs:
  git push origin master
  kubectl logs -n flux deployment/flux --since 10m --follow | egrep 'output="helmrelease.+demo.+deleted"'

# 5. Check Flux Helm Operator Logs:
  kubectl logs deployment/helm-operator -n flux --since 10m  --follow | egrep -i 'demo.+(delete|deleted|deleting)'

# 6. See Helm Releases
  helm ls
