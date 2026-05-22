# ArgoCD Weather

A Kubernetes-based weather application managed with ArgoCD for continuous deployment.

## Overview

This project demonstrates a containerized weather application deployed on Kubernetes using ArgoCD for GitOps-style continuous deployment and management.

## Project Structure

- **deployment.yaml** - Kubernetes Deployment configuration for the weather application
- **svc.yaml** - Kubernetes Service configuration to expose the application
- **README.md** - Project documentation (this file)

## Components

### Deployment
The `deployment.yaml` file contains:
- Container image configuration
- Pod replica management
- Resource limits and requests
- Environment variables for application configuration

### Service
The `svc.yaml` file contains:
- Service type and port configuration
- Pod selector matching
- Traffic routing and load balancing

## Getting Started

### Prerequisites
- Kubernetes cluster (1.19+)
- kubectl CLI configured
- ArgoCD installed on the cluster

### Installation

1. Clone the repository:
```bash
git clone https://github.com/kailashTuta/argocd-weather.git
cd argocd-weather
