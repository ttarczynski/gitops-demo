#!/bin/bash

# 1. Add the Flux chart repository:

helm repo add fluxcd https://charts.fluxcd.io

# 2. Install Weave Flux:

helm upgrade --install flux \
--namespace flux \
--values ./values_flux.yaml \
fluxcd/flux
