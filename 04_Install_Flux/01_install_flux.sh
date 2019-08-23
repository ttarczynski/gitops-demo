#!/bin/bash

# 1. Add the Flux chart repository:

helm repo add fluxcd https://charts.fluxcd.io

# 2. Install Flux:

chart_version='0.14.0'
helm upgrade --install flux \
--namespace flux \
--values ./values_flux.yaml \
--version $chart_version \
fluxcd/flux
