#!/bin/bash

# 1. Inspect the helm chart for the demo app
  find charts/demo/ | sort

# 2. Render chart templates locally and write manifests to /tmp/demo
  helm template ./charts/demo/ --output-dir /tmp
