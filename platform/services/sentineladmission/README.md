# SentinelAdmission

SentinelAdmission is a Kubernetes admission-control service that enforces **secure-by-default workload standards** using policy-as-code (OPA/Rego).

It blocks unsafe configurations at deploy time, provides explainable denials, and produces audit-friendly evidence for security and compliance workflows.

## MVP Invariants
- No privileged containers
- No hostPath volumes
- Workloads must run as non-root

## Why this exists
Admission control is the **control-plane boundary** of Kubernetes. SentinelAdmission ensures unsafe workloads never reach runtime.

## What this proves (Principal-level)
- Kubernetes admission controllers
- Policy-as-code enforcement
- Platform security primitives
- Shift-left + runtime enforcement
