#!/bin/vbash
# shellcheck disable=all

function set_firewall_default_action {
  zone=$1
  action=$2
  logging=$3

  set firewall ipv4 name $zone default-action $action
  if test "$logging" == "log"; then
    set firewall ipv4 name $zone enable-default-log
  fi
}

function allow_ntp {
  zone=$1

  # set firewall ipv4 name $zone rule 100 description 'Rule: accept ntp'
  set firewall ipv4 name $zone rule 100 action 'accept'
  set firewall ipv4 name $zone rule 100 destination port 'ntp'
  set firewall ipv4 name $zone rule 100 protocol 'udp'
}

function allow_dhcp {
  zone=$1

  # set firewall ipv4 name $zone rule 110 description 'Rule: accept dhcp'
  set firewall ipv4 name $zone rule 110 action 'accept'
  set firewall ipv4 name $zone rule 110 source port 'bootps,bootpc'
  set firewall ipv4 name $zone rule 110 destination port 'bootps,bootpc'
  set firewall ipv4 name $zone rule 110 protocol 'udp'
}

function allow_igmp {
  zone=$1

  # set firewall ipv4 name $zone rule 120 description 'Rule: accept igmp'
  set firewall ipv4 name $zone rule 120 action 'accept'
  set firewall ipv4 name $zone rule 120 protocol '2'
}

function allow_mdns {
  zone=$1

  # set firewall ipv4 name $zone rule 130 description 'Rule: accept mdns'
  set firewall ipv4 name $zone rule 130 action 'accept'
  set firewall ipv4 name $zone rule 130 source port 'mdns'
  set firewall ipv4 name $zone rule 130 destination port 'mdns'
  set firewall ipv4 name $zone rule 130 protocol 'udp'
}

function allow_icmp {
  zone=$1

  # set firewall ipv4 name $zone rule 140 description 'Rule: accept icmp'
  set firewall ipv4 name $zone rule 140 action 'accept'
  set firewall ipv4 name $zone rule 140 protocol 'icmp'
}

function allow_bgp {
  zone=$1

  # set firewall ipv4 name $zone rule 150 description 'Rule: accept bgp'
  set firewall ipv4 name $zone rule 150 action 'accept'
  set firewall ipv4 name $zone rule 150 destination port 'bgp'
  set firewall ipv4 name $zone rule 150 protocol 'tcp'
}

function allow_ssh {
  zone=$1

  # set firewall ipv4 name $zone rule 160 description 'Rule: accept ssh'
  set firewall ipv4 name $zone rule 160 action 'accept'
  set firewall ipv4 name $zone rule 160 destination port 'ssh'
  set firewall ipv4 name $zone rule 160 protocol 'tcp'
}

function allow_dns {
  zone=$1

  # set firewall ipv4 name $zone rule 170 description 'Rule: accept dns'
  set firewall ipv4 name $zone rule 170 action 'accept'
  set firewall ipv4 name $zone rule 170 destination port 'domain,domain-s'
  set firewall ipv4 name $zone rule 170 protocol 'tcp_udp'
}

function allow_wireguard {
  zone=$1

  # set firewall ipv4 name $zone rule 180 description 'Rule: accept wireguard'
  set firewall ipv4 name $zone rule 180 action 'accept'
  set firewall ipv4 name $zone rule 180 destination port '51820'
  set firewall ipv4 name $zone rule 180 protocol 'udp'
}

function  allow_plex_traffic {
  zone=$1

  # set firewall ipv4 name $zone rule 370 description 'Rule: accept plex users'
  set firewall ipv4 name $zone rule 370 action 'accept'
  set firewall ipv4 name $zone rule 370 source group address-group 'plex-users'
  set firewall ipv4 name $zone rule 370 destination group address-group 'plex-server'
  set firewall ipv4 name $zone rule 370 destination port '32400'
  set firewall ipv4 name $zone rule 370 protocol 'tcp'
}

function allow_printer_traffic {
  zone=$1

  # set firewall ipv4 name $zone rule 380 description 'Rule: accept_tcp_printer_from_allowed_devices'
  set firewall ipv4 name $zone rule 380 action 'accept'
  set firewall ipv4 name $zone rule 380 destination group address-group 'printers'
  set firewall ipv4 name $zone rule 380 destination port 'http,https,9100'
  set firewall ipv4 name $zone rule 380 protocol 'tcp'
}

function allow_sonos_controllers_to_players {
  zone=$1

  # set firewall ipv4 name $zone rule 430 description 'Rule: accept_tcp_from_sonos_controllers_to_sonos_players'
  set firewall ipv4 name $zone rule 430 action 'accept'
  set firewall ipv4 name $zone rule 430 source group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 430 destination group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 430 destination port '1400,1443,4444,7000,30000-65535'
  set firewall ipv4 name $zone rule 430 protocol 'tcp'
  # set firewall ipv4 name $zone rule 431 description 'Rule: accept_udp_from_sonos_controllers_to_sonos_players'
  set firewall ipv4 name $zone rule 431 action 'accept'
  set firewall ipv4 name $zone rule 431 source group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 431 destination group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 431 destination port '319,320,30000-65535'
  set firewall ipv4 name $zone rule 431 protocol 'udp'
}

function allow_sonos_controller_discovery {
  zone=$1

  # set firewall ipv4 name $zone rule 450 description 'Rule: accept_discovery_from_sonos_controllers'
  set firewall ipv4 name $zone rule 450 action 'accept'
  set firewall ipv4 name $zone rule 450 source group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 450 destination port '1900,1901,1902,57621'
  set firewall ipv4 name $zone rule 450 protocol 'udp'
}

function allow_rtsp {
  zone=$1

  # set firewall ipv4 name $zone rule 500 description 'Rule: accept rtsp'
  set firewall ipv4 name $zone rule 500 action 'accept'
  set firewall ipv4 name $zone rule 500 destination group address-group 'unifi-unvr'
}

function allow_iperf {
  zone=$1

  # set firewall ipv4 name $zone rule 330 description 'Rule: accept iperf'
  set firewall ipv4 name $zone rule 330 action 'accept'
  set firewall ipv4 name $zone rule 330 destination port '5001'
  set firewall ipv4 name $zone rule 330 protocol 'tcp'
}

set_firewall_default_action guest-homelab drop log
allow_plex_traffic guest-homelab

set_firewall_default_action guest-iot drop log
allow_printer_traffic guest-iot
allow_sonos_controllers_to_players guest-iot

set_firewall_default_action guest-lan drop log

set_firewall_default_action guest-local drop log
allow_ntp guest-local
allow_dhcp guest-local
allow_igmp guest-local
allow_mdns guest-local
allow_sonos_controller_discovery guest-local

set_firewall_default_action guest-servers drop log

set_firewall_default_action guest-services drop log
allow_dns guest-services

set_firewall_default_action guest-staging drop log

set_firewall_default_action guest-trusted drop log

set_firewall_default_action guest-wan accept no-log

set_firewall_default_action homelab-guest drop log

set_firewall_default_action homelab-iot accept no-log

set_firewall_default_action homelab-lan drop log
allow_icmp homelab-lan
allow_rtsp homelab-lan

set_firewall_default_action homelab-local drop log
allow_ntp homelab-local
allow_dhcp homelab-local
allow_icmp homelab-local
allow_bgp homelab-local
allow_iperf homelab-local
set firewall ipv4 name homelab-local rule 350 action 'accept'
set firewall ipv4 name homelab-local rule 350 description 'Rule: accept prometheus metrics scrape'
set firewall ipv4 name homelab-local rule 350 destination group port-group 'prometheus-metrics'
set firewall ipv4 name homelab-local rule 350 protocol 'tcp'
allow_sonos_controller_discovery homelab-local
set firewall ipv4 name homelab-local rule 910 action 'drop'
set firewall ipv4 name homelab-local rule 910 description 'Rule: drop multicast to 224.0.0.1 (no log)'
set firewall ipv4 name homelab-local rule 910 destination address '224.0.0.1'
set firewall ipv4 name homelab-local rule 910 protocol '2'

set_firewall_default_action homelab-servers accept no-log

set_firewall_default_action homelab-services accept no-log

set_firewall_default_action homelab-staging accept no-log

set_firewall_default_action homelab-trusted drop no-log
allow_icmp homelab-trusted

set_firewall_default_action homelab-wan accept no-log

set_firewall_default_action iot-guest drop log
set firewall ipv4 name iot-guest rule 420 action 'accept'
set firewall ipv4 name iot-guest rule 420 description 'Rule: accept_udp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-guest rule 420 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-guest rule 420 destination port '319,320,30000-65535'
set firewall ipv4 name iot-guest rule 420 protocol 'udp'
set firewall ipv4 name iot-guest rule 420 source group address-group 'sonos-players'
set firewall ipv4 name iot-guest rule 421 action 'accept'
set firewall ipv4 name iot-guest rule 421 description 'Rule: accept_tcp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-guest rule 421 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-guest rule 421 destination port '1400,3400,3401,3500,30000-65535'
set firewall ipv4 name iot-guest rule 421 protocol 'tcp'
set firewall ipv4 name iot-guest rule 421 source group address-group 'sonos-players'

set_firewall_default_action iot-homelab drop log
allow_plex_traffic iot-homelab
set firewall ipv4 name iot-homelab rule 420 action 'accept'
set firewall ipv4 name iot-homelab rule 420 description 'Rule: accept_udp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-homelab rule 420 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-homelab rule 420 destination port '319,320,30000-65535'
set firewall ipv4 name iot-homelab rule 420 protocol 'udp'
set firewall ipv4 name iot-homelab rule 420 source group address-group 'sonos-players'
set firewall ipv4 name iot-homelab rule 421 action 'accept'
set firewall ipv4 name iot-homelab rule 421 description 'Rule: accept_tcp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-homelab rule 421 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-homelab rule 421 destination port '1400,3400,3401,3500,30000-65535'
set firewall ipv4 name iot-homelab rule 421 protocol 'tcp'
set firewall ipv4 name iot-homelab rule 421 source group address-group 'sonos-players'
set firewall ipv4 name iot-homelab rule 460 action 'accept'
set firewall ipv4 name iot-homelab rule 460 description 'Rule: accept_music_library_sonos_players'
set firewall ipv4 name iot-homelab rule 460 destination group address-group 'sonos-library'
set firewall ipv4 name iot-homelab rule 460 destination port '4534,http,https'
set firewall ipv4 name iot-homelab rule 460 protocol 'tcp'
set firewall ipv4 name iot-homelab rule 460 source group address-group 'sonos-players'

set_firewall_default_action iot-lan drop log

set_firewall_default_action iot-local drop log
allow_ntp iot-local
allow_dhcp iot-local
allow_igmp iot-local
allow_mdns iot-local
set firewall ipv4 name iot-local rule 440 action 'accept'
set firewall ipv4 name iot-local rule 440 description 'Rule: accept_discovery_from_sonos_players'
set firewall ipv4 name iot-local rule 440 destination port '1900,1901,1902'
set firewall ipv4 name iot-local rule 440 protocol 'udp'
set firewall ipv4 name iot-local rule 440 source group address-group 'sonos-players'

set_firewall_default_action iot-servers drop log

set_firewall_default_action iot-services drop log

set_firewall_default_action iot-staging drop log

set_firewall_default_action iot-trusted drop log
set firewall ipv4 name iot-trusted rule 360 action 'accept'
set firewall ipv4 name iot-trusted rule 360 description 'Rule: accept scanner traffic'
set firewall ipv4 name iot-trusted rule 360 destination group address-group 'scanner-clients'
set firewall ipv4 name iot-trusted rule 360 destination group port-group 'scanner-outbound-ports'
set firewall ipv4 name iot-trusted rule 360 protocol 'udp'
set firewall ipv4 name iot-trusted rule 420 action 'accept'
set firewall ipv4 name iot-trusted rule 420 description 'Rule: accept_udp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-trusted rule 420 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-trusted rule 420 destination port '319,320,30000-65535'
set firewall ipv4 name iot-trusted rule 420 protocol 'udp'
set firewall ipv4 name iot-trusted rule 420 source group address-group 'sonos-players'
set firewall ipv4 name iot-trusted rule 421 action 'accept'
set firewall ipv4 name iot-trusted rule 421 description 'Rule: accept_tcp_from_sonos_players_to_sonos_controllers'
set firewall ipv4 name iot-trusted rule 421 destination group address-group 'sonos-controllers'
set firewall ipv4 name iot-trusted rule 421 destination port '1400,3400,3401,3500,30000-65535'
set firewall ipv4 name iot-trusted rule 421 protocol 'tcp'
set firewall ipv4 name iot-trusted rule 421 source group address-group 'sonos-players'

set_firewall_default_action iot-wan accept no-log

set_firewall_default_action lan-guest drop log

set_firewall_default_action lan-homelab drop log

set_firewall_default_action lan-iot drop log

set_firewall_default_action lan-local drop log
allow_ntp lan-local
allow_dhcp lan-local
allow_ssh lan-local
set firewall ipv4 name lan-local rule 900 action 'drop'
set firewall ipv4 name lan-local rule 900 description 'Rule: drop 10001 (no log)'
set firewall ipv4 name lan-local rule 900 destination port '10001'
set firewall ipv4 name lan-local rule 900 protocol 'udp'
set firewall ipv4 name lan-local rule 910 action 'drop'
set firewall ipv4 name lan-local rule 910 description 'Rule: drop multicast to 224.0.0.1 (no log)'
set firewall ipv4 name lan-local rule 910 destination address '224.0.0.1'
set firewall ipv4 name lan-local rule 910 protocol '2'

set_firewall_default_action lan-servers drop log

set_firewall_default_action lan-services accept log
allow_dns lan-services
set firewall ipv4 name lan-services rule 300 action 'accept'
set firewall ipv4 name lan-services rule 300 description 'Rule: accept unifi'
set firewall ipv4 name lan-services rule 300 destination group address-group 'unifi-controller'

set_firewall_default_action lan-staging drop log

set_firewall_default_action lan-trusted drop log
set firewall ipv4 name lan-trusted rule 900 action 'drop'
set firewall ipv4 name lan-trusted rule 900 description 'Rule: drop 10001 (no log)'
set firewall ipv4 name lan-trusted rule 900 destination port '10001'
set firewall ipv4 name lan-trusted rule 900 protocol 'udp'

set_firewall_default_action lan-wan accept no-log

set_firewall_default_action local-guest drop log
allow_igmp local-guest
allow_mdns local-guest
set firewall ipv4 name local-guest rule 410 action 'accept'
set firewall ipv4 name local-guest rule 410 description 'Rule: accept_discovery_from_sonos_players'
set firewall ipv4 name local-guest rule 410 destination port '1900,1901,1902'
set firewall ipv4 name local-guest rule 410 protocol 'udp'
set firewall ipv4 name local-guest rule 410 source group address-group 'sonos-players'

set_firewall_default_action local-homelab drop log
allow_icmp local-homelab
allow_bgp local-homelab
set firewall ipv4 name local-homelab rule 310 action 'accept'
set firewall ipv4 name local-homelab rule 310 description 'Rule: accept vector syslog'
set firewall ipv4 name local-homelab rule 310 destination port '6003'
set firewall ipv4 name local-homelab rule 310 protocol 'tcp'
set firewall ipv4 name local-homelab rule 410 action 'accept'
set firewall ipv4 name local-homelab rule 410 description 'Rule: accept_discovery_from_sonos_players'
set firewall ipv4 name local-homelab rule 410 destination port '1900,1901,1902'
set firewall ipv4 name local-homelab rule 410 protocol 'udp'
set firewall ipv4 name local-homelab rule 410 source group address-group 'sonos-players'

set_firewall_default_action local-iot drop log
allow_igmp local-iot
allow_mdns local-iot
allow_icmp local-iot
set firewall ipv4 name local-iot rule 400 action 'accept'
set firewall ipv4 name local-iot rule 400 description 'Rule: accept_discovery_from_sonos_controllers'
set firewall ipv4 name local-iot rule 400 destination port '1900,1901,1902,57621'
set firewall ipv4 name local-iot rule 400 protocol 'udp'
set firewall ipv4 name local-iot rule 400 source group address-group 'sonos-controllers'

set_firewall_default_action local-lan drop log
allow_icmp local-lan
allow_ssh local-lan

set_firewall_default_action local-servers drop log
allow_icmp local-servers
allow_bgp local-servers

set_firewall_default_action local-services accept no-log

set_firewall_default_action local-staging drop log
allow_icmp local-staging
allow_bgp local-staging

set_firewall_default_action local-trusted drop log
allow_igmp local-trusted
allow_mdns local-trusted
allow_icmp local-trusted
allow_wireguard local-trusted
set firewall ipv4 name local-trusted rule 410 action 'accept'
set firewall ipv4 name local-trusted rule 410 description 'Rule: accept_discovery_from_sonos_players'
set firewall ipv4 name local-trusted rule 410 destination port '1900,1901,1902'
set firewall ipv4 name local-trusted rule 410 protocol 'udp'
set firewall ipv4 name local-trusted rule 410 source group address-group 'sonos-players'

set_firewall_default_action local-wan accept no-log

set_firewall_default_action servers-guest drop log

set_firewall_default_action servers-homelab accept no-log

set_firewall_default_action servers-iot accept no-log

set_firewall_default_action servers-lan drop log
allow_icmp servers-lan
allow_rtsp servers-lan

set_firewall_default_action servers-local drop log
allow_ntp servers-local
allow_dhcp servers-local
allow_icmp servers-local
allow_bgp servers-local
allow_ssh servers-local
allow_iperf servers-local
set firewall ipv4 name servers-local rule 910 action 'drop'
set firewall ipv4 name servers-local rule 910 description 'Rule: drop multicast to 224.0.0.1 (no log)'
set firewall ipv4 name servers-local rule 910 destination address '224.0.0.1'
set firewall ipv4 name servers-local rule 910 protocol '2'

set_firewall_default_action servers-services accept no-log

set_firewall_default_action servers-staging accept no-log

set_firewall_default_action servers-trusted drop no-log
allow_icmp servers-trusted
allow_ssh servers-trusted

set_firewall_default_action servers-wan accept no-log

set_firewall_default_action services-guest drop log

set_firewall_default_action services-homelab accept no-log

set_firewall_default_action services-iot drop log
allow_icmp services-iot

set_firewall_default_action services-lan accept log
allow_icmp services-lan

set_firewall_default_action services-local drop log
allow_ntp services-local
allow_dhcp services-local

set_firewall_default_action services-servers accept no-log

set_firewall_default_action services-staging accept no-log

set_firewall_default_action services-trusted drop log

set_firewall_default_action services-wan accept no-log

set_firewall_default_action staging-guest drop log

set_firewall_default_action staging-homelab accept no-log

set_firewall_default_action staging-iot accept no-log

set_firewall_default_action staging-lan drop log
allow_icmp staging-lan

set_firewall_default_action staging-local drop log
allow_ntp staging-local
allow_dhcp staging-local
allow_icmp staging-local
allow_bgp staging-local
set firewall ipv4 name staging-local rule 350 action 'accept'
set firewall ipv4 name staging-local rule 350 description 'Rule: accept prometheus metrics scrape'
set firewall ipv4 name staging-local rule 350 destination group port-group 'prometheus-metrics'
set firewall ipv4 name staging-local rule 350 protocol 'tcp'
set firewall ipv4 name staging-local rule 910 action 'drop'
set firewall ipv4 name staging-local rule 910 description 'Rule: drop multicast to 224.0.0.1 (no log)'
set firewall ipv4 name staging-local rule 910 destination address '224.0.0.1'
set firewall ipv4 name staging-local rule 910 protocol '2'

set_firewall_default_action staging-servers accept no-log

set_firewall_default_action staging-services accept no-log

set_firewall_default_action staging-trusted drop no-log
allow_icmp staging-trusted

set_firewall_default_action staging-wan accept no-log

set_firewall_default_action trusted-guest drop log

set_firewall_default_action trusted-homelab drop log
set firewall ipv4 name trusted-homelab rule 520 action 'accept'
set firewall ipv4 name trusted-homelab rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-homelab rule 520 source group address-group 'scotte-devices'
set firewall ipv4 name trusted-homelab rule 530 action 'accept'
set firewall ipv4 name trusted-homelab rule 530 description 'Rule: accept sophie'
set firewall ipv4 name trusted-homelab rule 530 source group address-group 'sophie-devices'

set_firewall_default_action trusted-iot accept no-log
allow_sonos_controllers_to_players trusted-iot

set_firewall_default_action trusted-lan drop log
set firewall ipv4 name trusted-lan rule 520 action 'accept'
set firewall ipv4 name trusted-lan rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-lan rule 520 source group address-group 'scotte-devices'
set firewall ipv4 name trusted-lan rule 540 action 'accept'
set firewall ipv4 name trusted-lan rule 540 description 'Rule: accept cameras'
set firewall ipv4 name trusted-lan rule 540 source group address-group 'unifi-cameras'

set_firewall_default_action trusted-local drop log
allow_ntp trusted-local
allow_dhcp trusted-local
allow_igmp trusted-local
allow_mdns trusted-local
allow_icmp trusted-local
allow_ssh trusted-local
set firewall ipv4 name trusted-local rule 320 action 'accept'
set firewall ipv4 name trusted-local rule 320 description 'Rule: accept vnstat'
set firewall ipv4 name trusted-local rule 320 destination port '8685'
set firewall ipv4 name trusted-local rule 320 protocol 'tcp'
set firewall ipv4 name trusted-local rule 330 action 'accept'
set firewall ipv4 name trusted-local rule 330 description 'Rule: accept iperf'
set firewall ipv4 name trusted-local rule 330 destination port '5001'
set firewall ipv4 name trusted-local rule 330 protocol 'tcp'
set firewall ipv4 name trusted-local rule 340 action 'drop'
set firewall ipv4 name trusted-local rule 340 description 'Rule: ignore scansnap probe'
set firewall ipv4 name trusted-local rule 340 destination address '255.255.255.255'
set firewall ipv4 name trusted-local rule 340 destination port '52217'
set firewall ipv4 name trusted-local rule 340 protocol 'udp'
set firewall ipv4 name trusted-local rule 340 source group address-group 'scanner-clients'
allow_sonos_controller_discovery trusted-local

set_firewall_default_action trusted-servers drop log
set firewall ipv4 name trusted-servers rule 520 action 'accept'
set firewall ipv4 name trusted-servers rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-servers rule 520 source group address-group 'scotte-devices'
set firewall ipv4 name trusted-servers rule 530 action 'accept'
set firewall ipv4 name trusted-servers rule 530 description 'Rule: accept sophie'
set firewall ipv4 name trusted-servers rule 530 source group address-group 'sophie-devices'

set_firewall_default_action trusted-services accept no-log

set_firewall_default_action trusted-staging drop log
set firewall ipv4 name trusted-staging rule 520 action 'accept'
set firewall ipv4 name trusted-staging rule 520 description 'Rule: accept scotte'
set firewall ipv4 name trusted-staging rule 520 source group address-group 'scotte-devices'

set_firewall_default_action trusted-wan accept no-log

set_firewall_default_action wan-guest drop log

set_firewall_default_action wan-homelab drop log

set_firewall_default_action wan-iot drop log

set_firewall_default_action wan-lan drop log

set_firewall_default_action wan-local drop log
allow_wireguard wan-local

set_firewall_default_action wan-servers drop log

set_firewall_default_action wan-services drop log

set_firewall_default_action wan-staging drop log

set_firewall_default_action wan-trusted drop log
