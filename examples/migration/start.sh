#!/bin/sh

# Start the on premise cluster
docker-compose up -d

# Start Kubernetes
yard up --consul-port 18500 \
        --consul-values $PWD/helm-values.yml \
        --network migration_wan \
        --network-ip 192.169.7.100

# Create LB for Consul WAN data
yard expose --bind-ip none \
        --network migration_wan \
        --network-ip 192.169.7.130 \
        --service-name svc/consul-consul-server \
        --port 8600:8600 \
        --port 8500:8500 \
        --port 8302:8302 \
        --port 8301:8301 \
        --port 8300:8300

# Create LB for Gateway
yard expose \
--bind-ip none \
--network migration_wan \
--network-ip 192.169.7.140 \
--service-name svc/consul-consul-mesh-gateway \
--port 443:443
