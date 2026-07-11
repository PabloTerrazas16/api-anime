#!/bin/bash

# Deploy Kubernetes resources in correct order

echo "Creating namespace..."
kubectl apply -f k8s/namespace.yaml

echo "Waiting for namespace to be ready..."
kubectl wait --for=condition=ready namespace/docker-testing --timeout=10s || true

echo "Applying remaining Kubernetes resources..."
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/api-deployment.yaml
kubectl apply -f k8s/api-service.yaml
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/frontend-service.yaml

echo "Deployment complete!"
