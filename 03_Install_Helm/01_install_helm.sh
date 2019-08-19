#!/bin/bash

# 0. Istall minikube
#
#   Follow the instructions at: https://kubernetes.io/docs/tasks/tools/install-minikube/

# 1. Start minikube

minikube start

# 2. Install the Helm Client

curl -LO https://git.io/get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

# 3. Install Tiller

kubectl -n kube-system create sa tiller

kubectl create clusterrolebinding tiller-cluster-rule \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:tiller 

helm init --skip-refresh --upgrade --service-account tiller
