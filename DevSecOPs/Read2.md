### CICD Pipeline | DEVSECOPS | Real-World Projects

- DevSecops Build Pipeline Stages Real Time
  -> Build & Unit test -> Code Coverage -> SCA -> SAST -> Quality Gates -> Build Image -> Scan Image -> Smoke Test

---

## Continues Integration

- Stage 1: Build & Unit test

  - Generate Artifacts
  - Unit Test
  - Tools: Maven, NodeJS

- Stage 2: Code Coverage

  - Home Many lines of code you tested ?
  - Unused code
  - Tools: Jacoco

- Stage 3: Software composition analysis

  - Identify Vulnerabilities introduced bu open-source or 3rd parth libraries used in code
  - Tools: Owasp Dependency-Check

- Stage 4: Static Application Security Testing

  - Identify Vulnerabilities in proprietary code
  - Insecure coding practices
  - Tools: Sonarqube

- stage 5: Quality Gates

  - Check if application meets the quality standers
  - Tools: Sonarqube Quality Profile

- Stage 6: Build Docker image

  - Generate Deployable Artifact
  - Tools: Dockerfile

- State 7 : Scan Docker Image

  - Identify Vulnerabilities in Image layers
  - Tools: Trivy

- Stage 8 : Smoke Test
  - Verify if the Image is build Properly
  - Determine If Image/Application is ready for testing
  - Tools: Docker Container
