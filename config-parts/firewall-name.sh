#!/bin/vbash

# From LOCAL to SERVICES
set firewall name local-services description 'From LOCAL to SERVICES'
set firewall name local-services default-action 'accept'

# From LOCAL to WAN
set firewall name local-wan description 'From LOCAL to WAN'
set firewall name local-wan default-action 'accept'

# ---------------------------------

# From SERVICES to LOCAL
set firewall name services-local description 'From SERVICES to LOCAL'
set firewall name services-local default-action 'accept'

# From SERVICES to WAN
set firewall name services-wan description 'From SERVICES to WAN'
set firewall name services-wan default-action 'accept'

# ---------------------------------

# From WAN to LOCAL
set firewall name wan-local description 'From WAN to LOCAL'
set firewall name wan-local default-action 'accept'

# From WAN to SERVICES
set firewall name wan-services description 'From WAN to SERVICES'
set firewall name wan-services default-action 'accept'
