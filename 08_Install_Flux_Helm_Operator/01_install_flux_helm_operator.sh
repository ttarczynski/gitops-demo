#!/bin/bash

# 1. Enable Flux Helm Operator

chart_version='0.15.0'
helm upgrade --install flux \
--namespace flux \
--values ./values_flux.yaml \
--version $chart_version \
fluxcd/flux
