#!/bin/bash

# 1. Monitor results (run in separate terminal):
  URL="http://$(minikube ip):30080";
  watch -n 1 "kubectl get pod -n demo -Lapp/name -L app/instance -L app/version;
  echo '----';
  curl $URL -s"

# 2. Copy namespace and HelmRelease to /manifests
  cp 01_namespace.yaml 02_helm_release.yaml ../manifests/
  git status

# 3. Commit the changes to GIT:
  git add ../manifests/
  git commit --message="Release the demo app using Helm"

# 4. Push to github and observe Flux logs:
  git push origin master
  kubectl logs -n flux deployment/flux --since 10m --follow | egrep demo

# 5. See Flux Helm Operator logs:
  kubectl logs deployment/flux-helm-operator -n flux --since 5m  --follow | egrep demo

# 6. See Helm Releases
  helm ls
