FROM debian:latest

MAINTAINER Hans Hoechtl <hhoechtl@1drop.de>

# Define rancher compose version
ENV RANCHER_COMPOSE_VERSION v0.9.2

# Download and install rancher compose
RUN apt-get -yqq update && \
		apt-get install -yqq --no-install-recommends ca-certificates wget curl && \
		wget -qO- https://github.com/rancher/rancher-compose/releases/download/${RANCHER_COMPOSE_VERSION}/rancher-compose-linux-amd64-${RANCHER_COMPOSE_VERSION}.tar.gz | tar xvz -C /tmp && \
		mv /tmp/rancher-compose-${RANCHER_COMPOSE_VERSION}/rancher-compose /usr/local/bin/rancher-compose && \
		chmod +x /usr/local/bin/rancher-compose

# Cleanup image
RUN apt-get -yqq autoremove && \
		apt-get -yqq clean && \
		rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/*

# Define working directory.
WORKDIR /workspace
