## Prometheus

- Create a file name vim /etc/prometheus/prometheus.yml

```
vim /etc/prometheus/prometheus.yml

# Add the Code
global:
  scrape_interval: 5s

scrape_configs:
  - job_name: "nestjs"
    static_configs:
      - targets: ["nestjs:5000"]

```

1. Create a user-defined network (if not already created):

```
$docker network create monitoring

```

2. Run your NestJS container on that network:

```
docker run -d --name nestjs \
  --network monitoring \
  -p 5000:5000 \
  nextimage:v1

```

- **--name nestjs** is important — Prometheus will use this name as the hostname inside the network.

3. Run Prometheus container on the same network:

```
  # Create a volume
  docker volume create prometheus-data

  # Run this docker command for prometheus
   docker run -d --name prometheus \
    --network monitoring \
    -p 9090:9090 \
    -v /etc/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
    -v prometheus-data:/prometheus \
    prom/prometheus
```

4. Update prometheus.yml to use the container name:

```
global:
  scrape_interval: 5s

scrape_configs:
  - job_name: "nestjs"
    static_configs:
      - targets: ["nestjs:5000"]

```

5. Restart the Container

```
docker restart containername
```

---

### Home many TODO items were created in the last 2 days ?

How many pending TODO items are there at the moment?
**4 Types of Metrics:**

- Counter :
  - Number of TODO items created
  - Request Count
- Gauge :
  - Memory usage
- Histogram :

- Summary
docker run -d --name jenkins -p 8080:8080 jenkins/jenkins:lts
docker run -d --name sonarqube -p 9000:9000 sonarqube:lts

