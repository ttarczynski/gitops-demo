#!/bin/bash

# 1. Add the Flux chart repository:

helm repo add fluxcd https://charts.fluxcd.io

# 2. Create the flux namespace:
kubectl create namespace flux

# 3. Install Flux:

chart_version='1.5.0'
helm upgrade \
--install flux \
--namespace flux \
--values ./values_flux.yaml \
--version $chart_version \
fluxcd/flux
