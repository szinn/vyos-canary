#!/bin/vbash

# Container networks
set container network services prefix '10.20.20.0/24'
set container network services description 'Network for VyOS containers'

# onepassword-connect
set container name onepassword-connect image 'docker.io/1password/connect-api:1.6.1'
set container name onepassword-connect environment OP_HTTP_PORT value '8438'
set container name onepassword-connect memory '0'
set container name onepassword-connect network services address '10.20.20.6'
set container name onepassword-connect shared-memory '0'
set container name onepassword-connect volume credentials source '/config/secrets/1password-credentials.json'
set container name onepassword-connect volume credentials destination '/home/opuser/.op/1password-credentials.json'
set container name onepassword-connect volume credentials mode 'ro'
set container name onepassword-connect volume data source '/tmp/onepassword/data'
set container name onepassword-connect volume data destination '/home/opuser/.op/data'
set container name onepassword-connect volume data mode 'rw'

# onepassword-sync
set container name onepassword-sync image 'docker.io/1password/connect-sync:1.6.1'
set container name onepassword-sync memory '0'
set container name onepassword-sync shared-memory '0'
set container name onepassword-sync network services address '10.20.20.7'
set container name onepassword-sync volume credentials source '/config/secrets/1password-credentials.json'
set container name onepassword-sync volume credentials destination '/home/opuser/.op/1password-credentials.json'
set container name onepassword-sync volume credentials mode 'ro'
set container name onepassword-sync volume data source '/tmp/onepassword/data'
set container name onepassword-sync volume data destination '/home/opuser/.op/data'
set container name onepassword-sync volume data mode 'rw'
