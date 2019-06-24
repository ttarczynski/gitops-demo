#!/bin/bash

# 1. Add the Weave Flux chart repo:

helm repo add weaveworks https://weaveworks.github.io/flux

# 2. Install Weave Flux:

helm upgrade --install flux \
--namespace flux \
--values ./values_flux.yaml \
weaveworks/flux
