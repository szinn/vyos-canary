#!/bin/vbash

# From LAN to LOCAL
set firewall name lan-local description 'From LAN to LOCAL'
set firewall name lan-local default-action 'accept'

# From LAN to SERVICES
set firewall name lan-services description 'From LAN to SERVICES'
set firewall name lan-services default-action 'accept'

# From LAN to WAN
set firewall name lan-wan description 'From LAN to WAN'
set firewall name lan-wan default-action 'accept'

# ---------------------------------

# From LOCAL to LAN
set firewall name local-lan description 'From LOCAL to LAN'
set firewall name local-lan default-action 'accept'

# From LOCAL to SERVICES
set firewall name local-services description 'From LOCAL to SERVICES'
set firewall name local-services default-action 'accept'

# From LOCAL to WAN
set firewall name local-wan description 'From LOCAL to WAN'
set firewall name local-wan default-action 'accept'

# ---------------------------------

# From SERVICES to LAN
set firewall name services-lan description 'From SERVICES to LAN'
set firewall name services-lan default-action 'accept'

# From SERVICES to LOCAL
set firewall name services-local description 'From SERVICES to LOCAL'
set firewall name services-local default-action 'accept'

# From SERVICES to WAN
set firewall name services-wan description 'From SERVICES to WAN'
set firewall name services-wan default-action 'accept'

# ---------------------------------

# From WAN to LAN
set firewall name wan-lan description 'From WAN to LAN'
set firewall name wan-lan default-action 'drop'
set firewall name wan-lan enable-default-log

# From WAN to LOCAL
set firewall name wan-local description 'From WAN to LOCAL'
set firewall name wan-local default-action 'drop'

# From WAN to SERVICES
set firewall name wan-services description 'From WAN to SERVICES'
set firewall name wan-services default-action 'drop'
