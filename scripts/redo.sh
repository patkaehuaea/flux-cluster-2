#!/bin/bash

flux reconcile -n flux-system source git home-kubernetes
flux reconcile kustomization cluster-apps-cloudflared
helm get values cloudflare -n networking
kubectl get kustomizations.kustomize.toolkit.fluxcd.io -A
flux reconcile helmrelease cloudflare -n networking
k logs -f -l app.kubernetes.io/name=cloudflare-tunnel -n networking
