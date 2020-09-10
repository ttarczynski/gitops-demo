#!/bin/bash

# 1. Install the Helm Client

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# 2. Initialize a Helm Chart Repository

helm repo add stable https://kubernetes-charts.storage.googleapis.com/
