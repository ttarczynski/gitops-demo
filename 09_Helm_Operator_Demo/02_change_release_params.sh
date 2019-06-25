#!/bin/bash

# 1. Monitor results (run in separate terminal):
  URL=$(minikube service --url -n demo demo); watch -n 1 "kubectl get namespace demo; echo; kubectl get pod -Lapp/name -L app/instance -L app/version; echo; curl $URL -s"

# 2. Copy namespace and HelmRelease to /manifests
  cp ./02_helm_release.yaml.1 ../manifests/02_helm_release.yaml
  git status

# 3. Commit the changes to GIT:
  git add ../manifests/
  git commit --message="Change release params for the demo app"

# 4. Push to github and observe Flux logs:
  git push origin master
  kubectl logs -n flux deployment/flux --since 10m --follow | egrep demo

# 5. See Flux Helm Operator logs:
  kubectl logs deployment/flux-helm-operator -n flux --since 5m  --follow | egrep demo

# 6. See Helm Releases
  helm ls
  helm get values demo
