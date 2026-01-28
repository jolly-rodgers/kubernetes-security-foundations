# Cloud & Kubernetes Security Foundations Platform

## Overview

This platform provides **secure-by-default cloud and Kubernetes foundations** by enforcing critical security controls at **runtime**, not through documentation or best-effort guidance.

It is designed to be **consumed by engineers**, integrated into deployment workflows, and to produce **machine-readable evidence** suitable for audit, incident response, and continuous compliance.

The platform enables organizations to:
- Enforce security invariants automatically
- Reduce blast radius under compromise
- Provide developers a paved road to ship securely
- Maintain audit-ready posture without manual effort

---

## Problem Statement

In many organizations, cloud and Kubernetes security relies on:
- Documentation that is not enforced
- Point-in-time reviews
- Trust in developer correctness
- Reactive incident response

This leads to:
- Configuration drift
- Inconsistent security posture
- Weak audit evidence
- Late discovery of risk

This platform addresses those gaps by **making security controls non-optional and verifiable**.

---

## Platform Architecture

### 1. Policy Layer (Source of Truth)
- OPA / Rego policies define **what is allowed**
- Encodes security invariants (identity, network, runtime constraints)
- Versioned, reviewed, and testable

### 2. Enforcement Layer (Runtime Control)
- Kubernetes admission controllers (Gatekeeper)
- Kubernetes NetworkPolicy and egress controls
- **Hard deny at runtime**, not advisory warnings

### 3. Provisioning Layer (Secure-by-Default Infrastructure)
- Terraform modules for cloud and Kubernetes foundations
- Network segmentation, IAM guardrails, and baseline hardening
- No public exposure or privilege without explicit intent

### 4. Developer Interface (Paved Road)
- Engineers declare intent instead of implementing security
- YAML, Terraform, or annotations express required access
- Clear, actionable failure messages on violation

### 5. Audit & Evidence Layer
- Every allow/deny decision is logged
- Workload identity attached to enforcement events
- Produces **SOC 2 / NIST-ready evidence automatically**

---

## Design Principles

- **Default Deny**: Nothing is allowed unless explicitly declared
- **Runtime Enforcement**: Controls apply at execution time
- **Least Privilege**: Minimize blast radius by design
- **Evidence First**: All decisions produce audit artifacts
- **Developer Velocity**: Secure patterns are the easiest path

---

## Included Services

### SentinelAdmission
Kubernetes admission control enforcing baseline workload security:
- Namespace allow-listing
- `runAsNonRoot` enforcement
- Privilege and host access restrictions
- Immediate deny on violation

### SentinelEgress
Identity-aware, default-deny outbound network enforcement:
- Blocks direct internet access by default
- Routes approved traffic through a controlled gateway
- Logs all egress decisions for audit and incident response

---

## Outcomes

By adopting this platform, organizations achieve:
- Consistent security posture across environments
- Reduced incident blast radius
- Faster audits with stronger evidence
- Security controls that scale with engineering velocity
