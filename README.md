# Kubernetes Security Foundations Platform

**Secure-by-default Cloud & Kubernetes foundations platform** enforcing **runtime policy, admission controls, and audit-ready evidence** using Policy-as-Code.

This project demonstrates how a modern platform security team can **encode security invariants directly into Kubernetes**, rather than relying on documentation, reviews, or best-effort developer behavior.

---

## Why This Exists

Most Kubernetes environments fail security audits and incident response because:

- Security rules live in docs, not enforcement
- Controls are applied inconsistently across teams
- Violations are discovered *after* deployment
- Audit evidence is manual and incomplete

This platform solves those problems by making security **non-optional, versioned, and verifiable**.

---

## What This Platform Enforces

### 🔒 Admission Controls (Gatekeeper / OPA)
- Default-deny Kubernetes admission
- Enforces baseline Pod Security controls
- Blocks:
  - Privileged workloads
  - Root containers
  - Unsafe security contexts
  - Deployments to unapproved namespaces

### 🛣️ Developer “Paved Road”
- Clear, actionable denial messages
- Explicit rules developers can follow
- Compliant workloads deploy without intervention

### 📊 Audit & Evidence
- Every allow/deny decision is logged
- Violations are queryable and attributable
- Audit-ready evidence for SOC 2 / NIST / IR

---

## Repository Structure
.
├── ci/                     # CI & pipeline documentation
├── docs/
│   ├── PLATFORM_OVERVIEW.md  # Architecture & design rationale
│   ├── DEMO_FLOW.md          # Step-by-step demo narrative
│   └── screenshots-main/     # Evidence screenshots (deny/allow/audit)
├── platform/
│   └── services/
│       └── sentineladmission/
│           ├── k8s/          # Gatekeeper templates & constraints
│           ├── policy/       # Rego policies
│           ├── manifests/    # Example workloads
│           └── docs/         # Service roadmap
├── policies/                # Policy-as-code foundations
├── terraform/               # IaC placeholders for cloud expansion
└── README.md

---

## Key Demo Scenarios

The demo is intentionally structured to mirror **real platform usage**:

1. **Guardrails exist**  
   Non-compliant workloads are blocked by default.

2. **Enforcement is consistent**  
   Even approved namespaces must meet baseline security.

3. **Paved road works**  
   Compliant workloads deploy successfully without security involvement.

4. **Evidence is produced automatically**  
   Violations and allows are auditable and reviewable.

➡️ See **`docs/DEMO_FLOW.md`** and **`docs/screenshots-main/`** for the full walkthrough.

---

## Design Philosophy

This platform is designed to be:

- **Consumed by engineers**, not security alone
- **Composable** with CI/CD and IaC
- **Extensible** to runtime egress, identity, and cloud controls
- **Aligned with real-world platform security teams**

It reflects how mature organizations enforce security at scale.

---

## What This Demonstrates

- Principal-level Kubernetes security design
- Policy-as-Code enforcement (OPA / Gatekeeper)
- Runtime admission control (not linting)
- Audit-first security architecture
- Clear separation of policy, enforcement, and developer UX

---

## Future Extensions (Outlined, Not Implemented)

- SentinelEgress (egress control & identity-aware access)
- Workload identity binding
- Cloud IAM guardrails
- Continuous compliance pipelines
- Multi-cluster policy propagation

---

## License

MIT — intentionally permissive for demonstration and reuse.
