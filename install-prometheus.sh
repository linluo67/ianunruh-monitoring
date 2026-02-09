#!/bin/bash
##
# Installs Prometheus
#
# Provides:
# - Prometheus server (TCP/9090)
##
set -eux

source env.sh

PROMETHEUS_VERSION="2.45.0"

cd /tmp

# Download Prometheus
curl -sOL https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz

# Extract archive
tar xzf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz

# Move to system path
mv prometheus-${PROMETHEUS_VERSION}.linux-amd64 /opt/prometheus

# Create symlink for easier access
ln -sf /opt/prometheus/prometheus /usr/local/bin/prometheus
ln -sf /opt/prometheus/promtool /usr/local/bin/promtool

echo "Prometheus installed successfully"
