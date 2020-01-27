#!/bin/bash

# 1. Install Flux Helm Operator

chart_version='0.6.0'
helm upgrade \
--install helm-operator \
--namespace flux \
--values ./values_helm-operator.yaml \
--version $chart_version \
fluxcd/helm-operator
