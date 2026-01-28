package sentineladmission

default deny := []

# Extract containers from Pod or PodTemplate
containers[c] {
  input.request.object.kind == "Pod"
  c := input.request.object.spec.containers[_]
}

containers[c] {
  input.request.object.kind != "Pod"
  c := input.request.object.spec.template.spec.containers[_]
}

# Extract volumes from Pod or PodTemplate
volumes[v] {
  input.request.object.kind == "Pod"
  v := input.request.object.spec.volumes[_]
}

volumes[v] {
  input.request.object.kind != "Pod"
  v := input.request.object.spec.template.spec.volumes[_]
}

# Deny privileged containers
deny[msg] {
  some c
  containers[c]
  c.securityContext.privileged == true
  msg := "deny: privileged containers are not allowed"
}

# Deny hostPath volumes
deny[msg] {
  some v
  volumes[v]
  v.hostPath
  msg := "deny: hostPath volumes are not allowed"
}

# Require runAsNonRoot
deny[msg] {
  sc := pod_security_context
  not sc.runAsNonRoot
  msg := "deny: workload must set securityContext.runAsNonRoot=true"
}

pod_security_context := sc {
  input.request.object.kind == "Pod"
  sc := input.request.object.spec.securityContext
}

pod_security_context := sc {
  input.request.object.kind != "Pod"
  sc := input.request.object.spec.template.spec.securityContext
}
