#!/bin/bash

# 1. Install the HelmRelease Custom Resource Definition

chart_version='1.2.0'
kubectl apply -f "https://raw.githubusercontent.com/fluxcd/helm-operator/${chart_version}/deploy/crds.yaml"

# 2. Install Flux Helm Operator

helm upgrade \
--install helm-operator \
--namespace flux \
--values ./values_helm-operator.yaml \
--version $chart_version \
fluxcd/helm-operator
