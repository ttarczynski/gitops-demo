#!/bin/bash

# 1. Remove manifests from GIT:
  rm -f ../manifests/*.yaml
  git diff --stat

# 2. Commit the changes to GIT:
  git add ../manifests/
  git commit --message="Remove all files from /manifests"

# 3. Push to github:
  git push origin master

# 4. Remove the demo namespace
  kubectl delete namespaces demo --wait=false

# 5. See results:
  kubectl get namespaces
