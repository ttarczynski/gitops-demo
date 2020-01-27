#!/bin/bash

# 1. Show Flux deployment
  kubectl get deployments -n flux flux helm-operator

# 2. Copy namespace and HelmRelease to /manifests
  cp ./manifests/*.yaml ../manifests/
  git status

  vim ../manifests/01_namespace.yaml
  vim ../manifests/02_helm_release.yaml

# 3. Monitor results (run in separate terminal):
  URL="http://$(minikube ip):30080";
  watch -n 1 "kubectl get pod -n demo -Lapp/name -L app/instance -L app/version;
  echo '----';
  set -x;
  curl $URL -s"

# 4. Commit the changes to GIT:
  git add ../manifests/
  git commit --message="Release the demo app using Helm"

# 5. Push to github and observe Flux logs:
  git push origin master
  kubectl logs -n flux deployment/flux --since 10m --follow | egrep 'output=".+demo.+(created|configured).*"'

# 6. See Flux Helm Operator logs:
  kubectl logs deployment/helm-operator -n flux --since 10m  --follow | egrep demo

# 7. See Helm Releases
  helm ls
