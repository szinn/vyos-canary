#!/bin/vbash

# ALL -> WAN masquerade
set nat source rule 100 description 'ALL -> WAN'
set nat source rule 100 outbound-interface 'eth0'
set nat source rule 100 destination address '0.0.0.0/0'
set nat source rule 100 translation address 'masquerade'
