#!/bin/bash

# 1. Install the Helm Client

curl -LO https://git.io/get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

# 2. Install Tiller

kubectl -n kube-system create sa tiller

kubectl create clusterrolebinding tiller-cluster-rule \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:tiller 

helm init --skip-refresh --upgrade --service-account tiller
