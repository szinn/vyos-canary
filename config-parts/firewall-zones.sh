#!/bin/vbash

function create_zones {
  zone=$1
  shift
  set firewall zone $zone default-action 'drop'
  for source in $*; do
    set firewall zone $zone from $source firewall name $source-$zone
  done
}

function set_zone_interfaces {
  zone=$1
  shift
  for interface in $*; do
    set firewall zone $zone interface $interface
  done
}

# create_zones guest homelab iot lan local servers services staging trusted wan
# set_zone_interfaces guest eth0.199

# create_zones homelab guest iot lan local servers services staging trusted wan
# set_zone_interfaces homelab eth0.111

# create_zones iot guest homelab lan local servers services staging trusted wan
# set_zone_interfaces iot eth0.198

# create_zones lan guest homelab iot local servers services staging trusted wan
# set_zone_interfaces lan eth0.200

# create_zones local guest homelab iot lan servers services staging trusted wan
# set_zone_interfaces local local-zone

# create_zones servers guest homelab iot lan local services staging trusted wan
# set_zone_interfaces servers eth0.110

# create_zones services guest homelab iot lan local servers staging trusted wan
# set_zone_interfaces services pod-services

# create_zones staging guest homelab iot lan local servers services trusted wan
# set_zone_interfaces staging eth0.112

# create_zones trusted guest homelab iot lan local servers services staging wan
# set_zone_interfaces trusted eth0.120

# create_zones wan guest homelab iot lan local servers services staging trusted
# set_zone_interfaces wan eth0
