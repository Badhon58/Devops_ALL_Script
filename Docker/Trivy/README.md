### Trivy supports two targets for container images:

- Files inside container images: Vulnerabilities, Misconfigurations(IaC, K8s),
  Secrets, Licenses
- Container image metadata: Misconfigurations, Secrets
  Common commands:
  trivy image python:3,4-alpine
  trivy image gcr.io/destroless.pthons3-debian12

trivy image --severity CRITICAL golang:1.16-buster
trivy image --severity HIGH,CRITICAL gcr.io/distroless/bash-debains12

trivy image --scanners mis config --format json --output result.json trivy-test:v1

### Trivy Scanner for Docker Image Scanning

CI Integration

- Scan your image automatically as part of your CI workflow, failing the workflow if a vulnerability is found.
- when you don't want to fail the test, specify --exit-code 0
