# Observability and Monitoring

- Monitoring : Tells you when something is wrong in your system
- Observability : Helps you understand why the issue occurs

## Observability

1. Metrics
2. Logs
3. Traces

## EXAMPLE :

- User -> Payment Interface -> Payment backend -> Database
  - For Success:
    - Frontend Send request to https 50ms then backend process 150ms and then datanetlive to give me frontend.
    - payment processed successfully, payment orderID
  - For Failure :
    - https 50ms -> 150 ms <-> 800ms.
    - Payment Failed, DB insert timed out

--

- **Metrics**:
  - CPU will increase
  - Memory will increase
  - Now the Resource ot the server if we want to know the status of that resource then it is called Monitoring.
  - Prometheus is best (Pull based Mechanism) (PromQL)
  - **_Structure_**
    - Servers
      - Collect the metrics from all servers
    - Node Exporters
      - Pull the metrics from Node Exports
      - In the Server we need to configure Node Exporter agent
    - Prometheus
      - Indexing, labeling, time stamp and stores into TSDB (Time series database) here we can set time limit for rotation if I set retention period is 90 days
    - Grafana

- **Logs** :
  - Error logs irrespective of service
  - Grafana Loki (push '/error/success')
    - Push
    - Chunks and apply labeling
  - **_Structure_**
    - server
      - Collect the logs from given paths
    - Promtail, Fluentd, Fluent
      - send these logs to Grafana loki
      - In the Server we need to configure Promtail agent
    - Grafana loki
      - apply labeling, time stamp ect.
    - Grafana

- **Trace** :
  - Give exactly where the issue occur in flow.
  - Tempo
    - Tracing and a labeling
    - In the Server we need to configure Open Telemetry
  - **_Structure_** :
    - Server and Application (Backend)
      - Collect info
    - tempo
      - Stores the information
    - grafana

-> Note : Now in a server we need to install 3 agent

- Node Exporter(Prometheus)
- Pomtail(Grafana loki)
- OpenTelemetry(Tempo)

## Now from the Metrics, Logs, Trace are know as Observability.

--
