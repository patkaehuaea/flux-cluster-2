#!/bin/bash

flux reconcile -n flux-system source git home-kubernetes
flux reconcile kustomization cluster-apps-cloudflared
helm get values cloudflare -n networking
kubectl get kustomizations.kustomize.toolkit.fluxcd.io -A
