#!/bin/bash

# 1. Enable Flux Helm Operator

helm upgrade --install flux \
--namespace flux \
--values ./values_flux.yaml \
fluxcd/flux
