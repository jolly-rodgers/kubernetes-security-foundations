# Conftest Policies

This directory contains shift-left security policies evaluated using Conftest during CI/CD.

## Purpose
Prevent insecure infrastructure and Kubernetes resources from being deployed by enforcing policy before runtime.

## Validates
- Terraform plans
- Kubernetes manifests
- Configuration files

Conftest policies stop violations early and reduce security drift.
