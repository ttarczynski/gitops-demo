#!/bin/bash

kubectl -n flux logs deployment/flux | grep identity.pub | cut -d '"' -f2
