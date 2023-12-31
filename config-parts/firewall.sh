#!/bin/vbash

# General configuration
set firewall global-options state-policy established action 'accept'
set firewall global-options state-policy related action 'accept'
set firewall global-options all-ping enable
set firewall global-options broadcast-ping disable

# Services containers
set firewall group address-group unifi-controller address '10.201.5.2'
set firewall group address-group unifi-unvr address '10.200.0.32'

# k8s cluster services
set firewall group network-group k8s-main network '10.111.1.0/24'
set firewall group network-group k8s-staging network '10.112.1.0/24'

set firewall group address-group plex-server description 'Plex Server'
set firewall group address-group plex-server address '10.111.1.14'

# Unifi cameras
set firewall group address-group unifi-cameras description 'Unifi Cameras'
set firewall group address-group unifi-cameras address '10.120.0.8'

# Scanner client machines
set firewall group address-group scanner-clients address '10.120.0.19'
set firewall group address-group scanner-clients address '10.120.0.20'

# Printers
set firewall group address-group printers address '10.198.0.96'

# Scanner ports
set firewall group port-group scanner-outbound-ports port 52217
set firewall group port-group scanner-outbound-ports port 53220
set firewall group port-group scanner-outbound-ports port 55265

# Plex users
set firewall group address-group plex-users description 'Plex users'
set firewall group address-group plex-users address '10.198.0.52'
set firewall group address-group plex-users address "${GUEST_MEDIA_USERS}"

# Prometheus ports for metrics
set firewall group port-group prometheus-metrics port 9798 # speedtest
set firewall group port-group prometheus-metrics port 9100 # node-exporter
set firewall group port-group prometheus-metrics port 9342 # frr-exporter
set firewall group port-group prometheus-metrics port 9273 # vyos

# Sonos Music Library
set firewall group address-group sonos-library address '10.111.1.15'

# Sonos Controllers
set firewall group address-group sonos-controllers address '10.111.0.16-10.111.0.21' # Homelab
set firewall group address-group sonos-controllers address '10.111.1.15'
set firewall group address-group sonos-controllers address '10.120.0.16-10.120.0.20' # Scotte
set firewall group address-group sonos-controllers address '10.120.0.30'
set firewall group address-group sonos-controllers address '10.120.0.31'
set firewall group address-group sonos-controllers address '10.120.0.32-10.120.0.36' # Sophie
set firewall group address-group sonos-controllers address "${GUEST_MEDIA_USERS}"

# Sonos Players
set firewall group address-group sonos-players address '10.198.0.52' # SonyTV
set firewall group address-group sonos-players address '10.198.0.128-10.198.0.138'

# Scotte devices
set firewall group address-group scotte-devices address '10.120.0.16-10.120.0.20'
set firewall group address-group scotte-devices address '10.120.1.2-10.120.1.4'

# Sophie devices
set firewall group address-group sophie-devices address '10.120.0.32-10.120.0.36'
