#!/bin/vbash
# shellcheck disable=all

function create_firewall_rules {
  CURRENT_VLAN=$1
  set firewall zone ${CURRENT_VLAN} default-action 'drop'
}

function interfaces {
  for interface in $*; do
    set firewall zone ${CURRENT_VLAN} interface $interface
  done
}

function from_vlan {
  SOURCE_VLAN=$1
  ZONE=${SOURCE_VLAN}-${CURRENT_VLAN}
  set firewall zone ${CURRENT_VLAN} from ${SOURCE_VLAN} firewall name ${ZONE}
  case $2 in
    drop)
      set firewall ipv4 name ${ZONE} default-action 'drop'
      ;;
    drop-log)
      set firewall ipv4 name ${ZONE} default-action 'drop'
      set firewall ipv4 name ${ZONE} enable-default-log
      ;;
    accept)
      set firewall ipv4 name ${ZONE} default-action 'accept'
      ;;
    accept-log)
      set firewall ipv4 name ${ZONE} default-action 'accept'
      set firewall ipv4 name ${ZONE} enable-default-log
      ;;
  esac
}

function to_vlan {
  TARGET_VLAN=$1
  ZONE=${CURRENT_VLAN}-${TARGET_VLAN}
  set firewall zone ${TARGET_VLAN} from ${CURRENT_VLAN} firewall name ${ZONE}
  case $2 in
    drop)
      set firewall ipv4 name ${ZONE} default-action 'drop'
      ;;
    drop-log)
      set firewall ipv4 name ${ZONE} default-action 'drop'
      set firewall ipv4 name ${ZONE} enable-default-log
      ;;
    accept)
      set firewall ipv4 name ${ZONE} default-action 'accept'
      ;;
    accept-log)
      set firewall ipv4 name ${ZONE} default-action 'accept'
      set firewall ipv4 name ${ZONE} enable-default-log
      ;;
  esac
}

function allow_traffic {
  for type in $*; do
    allow_traffic_${type} ${ZONE}
  done
}

function drop_traffic {
  for type in $*; do
    drop_traffic_${type} ${ZONE}
  done
}
