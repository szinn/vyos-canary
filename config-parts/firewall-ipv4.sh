#!/bin/vbash
# shellcheck disable=all

function allow-traffic-ntp {
  zone=$1

  # set firewall ipv4 name $zone rule 100 description 'Rule: accept ntp'
  set firewall ipv4 name $zone rule 100 action 'accept'
  set firewall ipv4 name $zone rule 100 destination port 'ntp'
  set firewall ipv4 name $zone rule 100 protocol 'udp'
}

function allow-traffic-dhcp {
  zone=$1

  # set firewall ipv4 name $zone rule 110 description 'Rule: accept dhcp'
  set firewall ipv4 name $zone rule 110 action 'accept'
  set firewall ipv4 name $zone rule 110 source port 'bootps,bootpc'
  set firewall ipv4 name $zone rule 110 destination port 'bootps,bootpc'
  set firewall ipv4 name $zone rule 110 protocol 'udp'
}

function allow-traffic-igmp {
  zone=$1

  # set firewall ipv4 name $zone rule 120 description 'Rule: accept igmp'
  set firewall ipv4 name $zone rule 120 action 'accept'
  set firewall ipv4 name $zone rule 120 protocol '2'
}

function allow-traffic-mdns {
  zone=$1

  # set firewall ipv4 name $zone rule 130 description 'Rule: accept mdns'
  set firewall ipv4 name $zone rule 130 action 'accept'
  set firewall ipv4 name $zone rule 130 source port 'mdns'
  set firewall ipv4 name $zone rule 130 destination port 'mdns'
  set firewall ipv4 name $zone rule 130 protocol 'udp'
}

function allow-traffic-icmp {
  zone=$1

  # set firewall ipv4 name $zone rule 140 description 'Rule: accept icmp'
  set firewall ipv4 name $zone rule 140 action 'accept'
  set firewall ipv4 name $zone rule 140 protocol 'icmp'
}

function allow-traffic-bgp {
  zone=$1

  # set firewall ipv4 name $zone rule 150 description 'Rule: accept bgp'
  set firewall ipv4 name $zone rule 150 action 'accept'
  set firewall ipv4 name $zone rule 150 destination port 'bgp'
  set firewall ipv4 name $zone rule 150 protocol 'tcp'
}

function allow-traffic-ssh {
  zone=$1

  # set firewall ipv4 name $zone rule 160 description 'Rule: accept ssh'
  set firewall ipv4 name $zone rule 160 action 'accept'
  set firewall ipv4 name $zone rule 160 destination port 'ssh'
  set firewall ipv4 name $zone rule 160 protocol 'tcp'
}

function allow-traffic-dns {
  zone=$1

  # set firewall ipv4 name $zone rule 170 description 'Rule: accept dns'
  set firewall ipv4 name $zone rule 170 action 'accept'
  set firewall ipv4 name $zone rule 170 destination port 'domain,domain-s'
  set firewall ipv4 name $zone rule 170 protocol 'tcp_udp'
}

function allow-traffic-wireguard {
  zone=$1

  # set firewall ipv4 name $zone rule 180 description 'Rule: accept wireguard'
  set firewall ipv4 name $zone rule 180 action 'accept'
  set firewall ipv4 name $zone rule 180 destination port '51820'
  set firewall ipv4 name $zone rule 180 protocol 'udp'
}

function allow-traffic-plex {
  zone=$1

  # set firewall ipv4 name $zone rule 370 description 'Rule: accept plex users'
  set firewall ipv4 name $zone rule 370 action 'accept'
  set firewall ipv4 name $zone rule 370 source group address-group 'plex-users'
  set firewall ipv4 name $zone rule 370 destination group address-group 'plex-server'
  set firewall ipv4 name $zone rule 370 destination port '32400'
  set firewall ipv4 name $zone rule 370 protocol 'tcp'
}

function allow-traffic-printer {
  zone=$1

  # set firewall ipv4 name $zone rule 380 description 'Rule: accept_tcp_printer_from_allowed_devices'
  set firewall ipv4 name $zone rule 380 action 'accept'
  set firewall ipv4 name $zone rule 380 destination group address-group 'printers'
  set firewall ipv4 name $zone rule 380 destination port 'http,https,9100'
  set firewall ipv4 name $zone rule 380 protocol 'tcp'
}

function allow-traffic-scanner {
  zone=$1

  # set firewall ipv4 name $zone rule 360 description 'Rule: accept scanner traffic'
  set firewall ipv4 name $zone rule 360 action 'accept'
  set firewall ipv4 name $zone rule 360 destination group address-group 'scanner-clients'
  set firewall ipv4 name $zone rule 360 destination group port-group 'scanner-outbound-ports'
  set firewall ipv4 name $zone rule 360 protocol 'udp'
}

function allow-traffic-sonos {
  zone=$1

  # set firewall ipv4 name $zone rule 400 description 'Rule: accept_discovery_from_sonos_controllers'
  set firewall ipv4 name $zone rule 400 action 'accept'
  set firewall ipv4 name $zone rule 400 source group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 400 destination port '1900,1901,1902,57621'
  set firewall ipv4 name $zone rule 400 protocol 'udp'
  # set firewall ipv4 name $zone rule 410 description 'Rule: accept_discovery_from_sonos_players'
  set firewall ipv4 name $zone rule 410 action 'accept'
  set firewall ipv4 name $zone rule 410 destination port '1900,1901,1902'
  set firewall ipv4 name $zone rule 410 protocol 'udp'
  set firewall ipv4 name $zone rule 410 source group address-group 'sonos-players'
  # set firewall ipv4 name $zone rule 420 description 'Rule: accept_udp_from_sonos_players_to_sonos_controllers'
  set firewall ipv4 name $zone rule 420 action 'accept'
  set firewall ipv4 name $zone rule 420 source group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 420 destination group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 420 destination port '319,320,30000-65535'
  set firewall ipv4 name $zone rule 420 protocol 'udp'
  # set firewall ipv4 name $zone rule 421 description 'Rule: accept_tcp_from_sonos_players_to_sonos_controllers'
  set firewall ipv4 name $zone rule 421 action 'accept'
  set firewall ipv4 name $zone rule 421 source group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 421 destination group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 421 destination port '1400,3400,3401,3500,30000-65535'
  set firewall ipv4 name $zone rule 421 protocol 'tcp'
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
  # set firewall ipv4 name $zone rule 440 description 'Rule: accept_discovery_from_sonos_players'
  set firewall ipv4 name $zone rule 440 action 'accept'
  set firewall ipv4 name $zone rule 440 source group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 440 destination port '1900,1901,1902'
  set firewall ipv4 name $zone rule 440 protocol 'udp'
  # set firewall ipv4 name $zone rule 450 description 'Rule: accept_discovery_from_sonos_controllers'
  set firewall ipv4 name $zone rule 450 action 'accept'
  set firewall ipv4 name $zone rule 450 source group address-group 'sonos-controllers'
  set firewall ipv4 name $zone rule 450 destination port '1900,1901,1902,57621'
  set firewall ipv4 name $zone rule 450 protocol 'udp'
  # set firewall ipv4 name $zone rule 460 description 'Rule: accept_music_library_sonos_players'
  set firewall ipv4 name $zone rule 460 action 'accept'
  set firewall ipv4 name $zone rule 460 source group address-group 'sonos-players'
  set firewall ipv4 name $zone rule 460 destination group address-group 'sonos-library'
  set firewall ipv4 name $zone rule 460 destination port '4534,http,https'
  set firewall ipv4 name $zone rule 460 protocol 'tcp'
}

function allow-traffic-rtsp {
  zone=$1

  # set firewall ipv4 name $zone rule 500 description 'Rule: accept rtsp'
  set firewall ipv4 name $zone rule 500 action 'accept'
  set firewall ipv4 name $zone rule 500 destination group address-group 'unifi-unvr'
}

function allow-traffic-iperf {
  zone=$1

  # set firewall ipv4 name $zone rule 330 description 'Rule: accept iperf'
  set firewall ipv4 name $zone rule 330 action 'accept'
  set firewall ipv4 name $zone rule 330 destination port '5001'
  set firewall ipv4 name $zone rule 330 protocol 'tcp'
}

function allow-traffic-scottes_devices {
  zone=$1

  # set firewall ipv4 name $zone rule 520 description 'Rule: accept scotte'
  set firewall ipv4 name $zone rule 520 action 'accept'
  set firewall ipv4 name $zone rule 520 source group address-group 'scotte-devices'
}

function allow-traffic-sophies_devices {
  zone=$1

  # set firewall ipv4 name $zone rule 530 description 'Rule: accept sophie'
  set firewall ipv4 name $zone rule 530 action 'accept'
  set firewall ipv4 name $zone rule 530 source group address-group 'sophie-devices'
}

function allow-traffic-prometheus {
  zone=$1

  # set firewall ipv4 name $zone rule 350 description 'Rule: accept prometheus metrics scrape'
  set firewall ipv4 name $zone rule 350 action 'accept'
  set firewall ipv4 name $zone rule 350 destination group port-group 'prometheus-metrics'
  set firewall ipv4 name $zone rule 350 protocol 'tcp'
}

function allow-traffic-vector {
  zone=$1

  # set firewall ipv4 name $zone rule 310 description 'Rule: accept vector syslog'
  set firewall ipv4 name $zone rule 310 action 'accept'
  set firewall ipv4 name $zone rule 310 destination port '6003'
  set firewall ipv4 name $zone rule 310 protocol 'tcp'
}

function allow-traffic-unifi {
  zone=$1

  # set firewall ipv4 name $zone rule 300 description 'Rule: accept unifi'
  set firewall ipv4 name $zone rule 300 action 'accept'
  set firewall ipv4 name $zone rule 300 destination group address-group 'unifi-controller'
  # set firewall ipv4 name $zone rule 540 description 'Rule: accept cameras'
  set firewall ipv4 name $zone rule 540 action 'accept'
  set firewall ipv4 name $zone rule 540 source group address-group 'unifi-cameras'
}

function drop-traffic-multicast-224 {
  zone=$1

  # set firewall ipv4 name $zone rule 910 description 'Rule: drop multicast to 224.0.0.1 (no log)'
  set firewall ipv4 name $zone rule 910 action 'drop'
  set firewall ipv4 name $zone rule 910 destination address '224.0.0.1'
  set firewall ipv4 name $zone rule 910 protocol '2'
}

function drop-traffic-port-10001 {
  zone=$1

  # set firewall ipv4 name $zone rule 900 description 'Rule: drop 10001 (no log)'
  set firewall ipv4 name $zone rule 900 action 'drop'
  set firewall ipv4 name $zone rule 900 destination port '10001'
  set firewall ipv4 name $zone rule 900 protocol 'udp'
}

function drop-traffic-scansnap_probe {
  zone=$1

  set firewall ipv4 name $zone rule 999 action 'drop'
  set firewall ipv4 name $zone rule 999 description 'Rule: ignore scansnap probe'
  set firewall ipv4 name $zone rule 999 destination address '255.255.255.255'
  set firewall ipv4 name $zone rule 999 destination port '52217'
  set firewall ipv4 name $zone rule 999 protocol 'udp'
  set firewall ipv4 name $zone rule 999 source group address-group 'scanner-clients'
}

function drop-traffic-invalid {
  zone=$1

  set firewall ipv4 name $zone rule 999 action 'drop'
  set firewall ipv4 name $zone rule 999 description 'Rule: drop_invalid'
  set firewall ipv4 name $zone rule 999 state invalid
  set firewall ipv4 name $zone rule 999 log
}

create-firewall-rules guest
  interfaces eth0.199
  to-vlan homelab drop-log
    allow-traffic plex
  to-vlan iot drop-log
    allow-traffic printer sonos
  to-vlan lan drop-log
  to-vlan local drop-log
    allow-traffic dhcp igmp mdns ntp sonos
  to-vlan servers drop-log
  to-vlan services drop-log
    allow-traffic dns
  to-vlan staging drop-log
  to-vlan trusted drop-log
  to-vlan wan accept

create-firewall-rules homelab
  interfaces eth0.111
  to-vlan guest drop-log
  to-vlan iot accept
  to-vlan lan drop-log
    allow-traffic icmp rtsp
  to-vlan local drop-log
    allow-traffic bgp dhcp icmp iperf ntp sonos prometheus
    drop-traffic multicast-224
  to-vlan servers accept
  to-vlan services accept
  to-vlan staging accept
  to-vlan trusted drop
    allow-traffic icmp
  to-vlan wan accept

create-firewall-rules iot
  interfaces eth0.198
  to-vlan guest drop-log
    allow-traffic sonos
  to-vlan homelab drop-log
    allow-traffic plex sonos
  to-vlan lan drop-log
  to-vlan local drop-log
    allow-traffic dhcp igmp mdns ntp sonos
  to-vlan servers drop-log
  to-vlan services drop-log
  to-vlan staging drop-log
  to-vlan trusted drop-log
    allow-traffic sonos scanner
  to-vlan wan accept

create-firewall-rules lan
  interfaces eth0.200
  to-vlan guest drop-log
  to-vlan homelab drop-log
  to-vlan iot drop-log
  to-vlan local drop-log
    allow-traffic dhcp ntp ssh
    drop-traffic multicast-224 port-10001
  to-vlan servers drop-log
  to-vlan services accept-log
    allow-traffic dns unifi
  to-vlan staging drop-log
  to-vlan trusted drop-log
    drop-traffic port-10001
  to-vlan wan accept

create-firewall-rules local
  interfaces local-zone
  to-vlan guest drop-log
    allow-traffic igmp mdns sonos
  to-vlan homelab drop-log
    allow-traffic bgp icmp sonos vector
  to-vlan iot drop-log
    allow-traffic icmp igmp mdns sonos
  to-vlan lan drop-log
    allow-traffic icmp ssh
  to-vlan servers drop-log
    allow-traffic bgp icmp
  to-vlan services accept
  to-vlan staging drop-log
    allow-traffic bgp icmp
  to-vlan trusted drop-log
    allow-traffic icmp igmp mdns sonos wireguard
  to-vlan wan accept

create-firewall-rules servers
  interfaces eth0.110
  to-vlan guest drop-log
  to-vlan homelab accept
  to-vlan iot accept
  to-vlan lan drop-log
    allow-traffic icmp rtsp
  to-vlan local drop-log
    allow-traffic bgp dhcp icmp iperf ntp ssh
    drop-traffic multicast-224
  to-vlan services accept
  to-vlan staging accept
  to-vlan trusted drop
    allow-traffic icmp ssh
  to-vlan wan accept

create-firewall-rules services
  interfaces pod-services
  to-vlan guest drop-log
  to-vlan homelab accept
  to-vlan iot drop-log
    allow-traffic icmp
  to-vlan lan accept-log
    allow-traffic icmp
  to-vlan local drop-log
    allow-traffic ntp
  to-vlan servers accept
  to-vlan staging accept
  to-vlan trusted drop-log
  to-vlan wan accept

create-firewall-rules staging
  interfaces eth0.112
  to-vlan guest drop-log
  to-vlan homelab accept
  to-vlan iot accept
  to-vlan lan drop-log
    allow-traffic icmp
  to-vlan local drop-log
    allow-traffic bgp dhcp icmp ntp
    drop-traffic multicast-224
  to-vlan servers accept
  to-vlan services accept
  to-vlan trusted drop
    allow-traffic icmp
  to-vlan wan accept

create-firewall-rules trusted
  interfaces eth0.120
  to-vlan guest drop-log
  to-vlan homelab drop-log
    allow-traffic scottes_devices sophies_devices
  to-vlan iot accept
    allow-traffic sonos
  to-vlan lan drop-log
    allow-traffic scottes_devices unifi
  to-vlan local drop-log
    allow-traffic dhcp icmp igmp iperf mdns ntp ssh sonos scottes_devices
    drop-traffic scansnap_probe
  to-vlan servers drop-log
    allow-traffic scottes_devices sophies_devices
  to-vlan services accept
  to-vlan staging drop-log
    allow-traffic scottes_devices
  to-vlan wan accept

create-firewall-rules wan
  interfaces eth0
  to-vlan guest drop-log
  to-vlan homelab drop-log
  to-vlan iot drop-log
  to-vlan lan drop-log
  to-vlan local drop-log
    allow-traffic wireguard
  to-vlan servers drop-log
  to-vlan services drop-log
  to-vlan staging drop-log
  to-vlan trusted drop-log
