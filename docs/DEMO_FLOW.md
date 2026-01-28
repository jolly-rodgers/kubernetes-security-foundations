# Demo Flow — Runtime Enforcement & Evidence

This document walks through the live demonstration of the **Cloud & Kubernetes Security Foundations Platform**, showing how security controls are **enforced at runtime**, how developers interact with guardrails, and how **audit-ready evidence** is produced automatically.

Each scene corresponds to a screenshot captured during execution.

---

## Scene 1 — Guardrails Exist (DENY)

**Screenshot:**  
Developer attempts to deploy a pod that violates baseline security requirements.

**Control Enforced:**  
- Kubernetes Admission Control (Gatekeeper)
- SentinelAdmission ConstraintTemplate
- Enforced invariants:
  - `runAsNonRoot=true`
  - Approved namespaces only
  - No privileged workloads

**Outcome:**  
- Pod creation is **blocked at admission**
- Deployment fails immediately with a clear error message

**Evidence Produced:**  
- Admission webhook denial message
- Constraint name (`sentineladmission-baseline`)
- Explicit reason for failure logged by Gatekeeper

---

## Scene 2 — Approved Namespace, Still Enforced (DENY)

**Screenshot:**  
Developer deploys a workload into an approved namespace (`payments`) but violates runtime security requirements.

**Control Enforced:**  
- Admission Controller validates **workload security context**
- Namespace approval does **not** bypass runtime controls

**Outcome:**  
- Deployment is denied
- Developer receives actionable feedback:
  - Missing `runAsNonRoot=true`

**Evidence Produced:**  
- Gatekeeper violation tied to:
  - Namespace
  - Workload identity
  - Specific violated invariant

---

## Scene 3 — Developer Follows the Paved Road (ALLOW)

**Screenshot:**  
Developer deploys a compliant workload:
- Approved namespace
- Non-root execution
- No privileged escalation

**Control Enforced:**  
- Same admission controls as previous scenes
- Policy evaluation passes

**Outcome:**  
- Pod is successfully created
- No security exceptions required
- Secure path is the easiest path

**Evidence Produced:**  
- Successful admission decision
- Policy evaluation logged
- Implicit evidence that controls are satisfied

---

## Scene 4 — Evidence & Audit (Principal-Level)

**Screenshot:**  
Audit logs and enforcement results displayed.

**Control Enforced:**  
- Continuous policy enforcement
- Automatic evidence generation

**Outcome:**  
- All enforcement decisions are:
  - Machine-readable
  - Attributable to workload identity
  - Available for audit or incident response

**Evidence Produced:**  
- Admission controller logs
- Constraint violation summaries
- Timestamped, policy-linked decisions
- SOC 2 / NIST-ready artifacts without manual effort

---

## Why This Matters

This demo proves:
- Security controls are **non-optional**
- Enforcement happens **before risk reaches production**
- Developers are guided, not blocked arbitrarily
- Audit evidence is produced **as a byproduct of normal operation**

This is a **security platform**, not a checklist or documentation exercise.

---

## Mapping to Platform Goals

| Goal | Demonstrated |
|----|----|
| Runtime enforcement | ✅ |
| Default-deny posture | ✅ |
| Developer paved road | ✅ |
| Blast radius reduction | ✅ |
| Audit-ready evidence | ✅ |
| Principal-level ownership | ✅ |

