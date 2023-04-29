#!/bin/vbash

set interfaces ethernet eth0 description 'WAN'
set interfaces ethernet eth0 address 'dhcp'

set interfaces ethernet eth1 description 'LAN'
set interfaces ethernet eth1 address 'dhcp'
