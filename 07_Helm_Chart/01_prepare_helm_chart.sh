#!/bin/bash

# 1. Inspect the helm chart for the demo app
  find charts/demo/ | sort
  egrep -r 'blue:|green:|image:|tag:' charts/

  vim charts/demo/templates/03_deployment_blue.yaml -c "/image:"
  vim charts/demo/values.yaml -c "/tag:"
  vim charts/demo/templates/04_service.yaml -c "/app\/instance:"

# 2. Render chart templates locally and write manifests to /tmp/demo
  helm template ./charts/demo/ --output-dir /tmp

  cat charts/demo/values.yaml
  egrep -r 'replicas:|image:' /tmp/demo/templates/03_deployment*
  egrep -r -H 'app/instance:' /tmp/demo/templates/04_service*
