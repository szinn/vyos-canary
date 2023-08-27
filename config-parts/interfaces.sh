#!/bin/vbash

set interfaces ethernet eth0 description 'WAN'
set interfaces ethernet eth0 address 'dhcp'

set interfaces ethernet eth0 vif 200 description 'LAN'
set interfaces bonding bond0 vif 200 address '10.200.0.1/24'
set interfaces ethernet eth0 vif 110 description 'SERVERS'
set interfaces bonding bond0 vif 110 address '10.110.0.1/24'
set interfaces bonding bond0 vif 111 description 'HOMELAB'
set interfaces bonding bond0 vif 111 address '10.111.0.1/24'
set interfaces bonding bond0 vif 112 description 'STAGING'
set interfaces bonding bond0 vif 112 address '10.112.0.1/24'
set interfaces bonding bond0 vif 120 description 'TRUSTED'
set interfaces bonding bond0 vif 120 address '10.120.0.1/24'
set interfaces bonding bond0 vif 198 description 'IOT'
set interfaces bonding bond0 vif 198 address '10.198.0.1/24'
set interfaces bonding bond0 vif 199 description 'GUEST'
set interfaces bonding bond0 vif 199 address '10.199.0.1/24'
