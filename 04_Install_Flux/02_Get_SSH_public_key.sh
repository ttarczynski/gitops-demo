#!/bin/bash

# 1. Get SSH public key
kubectl -n flux logs deployment/flux | grep identity.pub | cut -d '"' -f2

# 2. Copy the public key and create a deploy key with write access on your GitHub repository.
#
# Open GitHub, navigate to your fork, go to Setting > Deploy keys,
#  click on Add deploy key, give it a Title,
#  check Allow write access, paste the Flux public key and click Add key.
#
#   (see docs: https://docs.fluxcd.io/en/1.20.2/tutorials/get-started-helm/#giving-write-access)
