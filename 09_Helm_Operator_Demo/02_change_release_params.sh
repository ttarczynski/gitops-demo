#!/bin/bash

# 1. Monitor results (run in separate terminal):
  URL="http://$(minikube ip):30080";
  watch -n 1 "kubectl get pod -n demo -Lapp/name -L app/instance -L app/version;
  echo '----';
  set -x;
  curl $URL -s"

# 2. Copy namespace and HelmRelease to /manifests
  cp ./manifests/02_helm_release.yaml.1 ../manifests/02_helm_release.yaml
  git diff

# 3. Commit the changes to GIT:
  git add ../manifests/
  git commit --message="Change release params for the demo app"

# 4. Push to github and observe Flux logs:
  git push origin master
  kubectl logs -n flux deployment/flux --since 10m --follow | egrep 'output=".+demo.+(created|configured).*"'

# 5. See Flux Helm Operator logs:
  kubectl logs -n flux deployment/helm-operator --since 10m  --follow | egrep '"running upgrade"|"upgrade succeeded"'

# 6. See Helm Releases
  helm ls -n demo
  helm get values demo
