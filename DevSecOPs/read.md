## SonarQube Architecture

- Server stores results and runs rules; scanners analyze code in CI and push reports to the server.

### SonarQube Server (What we installed)

- Central service storing analysis results, metrics, and issues.
- Provides web UI for browsing projects and triaging issuse
- Runs compute engine evaluating rules, metricse, quality gates.
- Stores data in DB: projects, measures, settings, users.
- Exposes HTTP API for scanners, CI, and integrations.

### SonarQube Scanner (The client/agent)

- Client that analyzes code and produces an analysis report.
- Runs is CI agents, build servers, or developer machines.
- Reads config, collects sources, tests, and converage reports.
- Stateless and scalable: many agents upload to one server.
- common variants: Maven, Gradle, MSBuild, generic sonar-scanner

### Demo: SonarQube with Docker, Maven & Jenkins

- End-to-end inject bad code, run Sonar scan, enforce quality gate, build container
  ->Checkout private Git repo -> Build(Compile) (JoCoCo Plugin) -> SonarQube Scan (Static Analysis) -> Quality gate Decision -> Build & Containerize -> Run Container

### To set Token via github

token=badhonbiswas
git remote set-url private-repo https://<Token>@github.com/githubname/project.git