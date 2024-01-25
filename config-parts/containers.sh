#!/bin/vbash

# Container networks
set container network services prefix '10.20.20.0/24'
set container network services description 'Network for VyOS containers'

# coredns
set container name coredns cap-add 'net-bind-service'
set container name coredns image 'docker.io/coredns/coredns:1.10.1'
set container name coredns memory '0'
set container name coredns network services address '10.20.20.3'
set container name coredns restart 'on-failure'
set container name coredns shared-memory '0'
set container name coredns volume config source '/config/containers/coredns/config'
set container name coredns volume config destination '/config'
set container name coredns volume config mode 'ro'
set container name coredns volume corefile source '/config/containers/coredns/config/Corefile'
set container name coredns volume corefile destination '/Corefile'
set container name coredns volume corefile mode 'ro'
set container name coredns volume vyoshosts source '/etc/hosts'
set container name coredns volume vyoshosts destination '/host/etc/hosts'
set container name coredns volume vyoshosts mode 'ro'

# dnsdist
set container name dnsdist cap-add 'net-bind-service'
set container name dnsdist environment TZ value 'Europe/Amsterdam'
set container name dnsdist image 'docker.io/powerdns/dnsdist-18:1.8.0'
set container name dnsdist arguments '--log-timestamps'
set container name dnsdist memory '0'
set container name dnsdist network services address '10.20.20.4'
set container name dnsdist restart 'on-failure'
set container name dnsdist shared-memory '0'
set container name dnsdist volume config source '/config/containers/dnsdist/config/dnsdist.conf'
set container name dnsdist volume config destination '/etc/dnsdist/dnsdist.conf'
set container name dnsdist volume config mode 'ro'

# gatus
set container name gatus cap-add 'net-bind-service'
set container name gatus cap-add 'net-raw'
set container name gatus image 'ghcr.io/twin/gatus:latest'
set container name gatus memory '0'
set container name gatus network services address '10.20.20.5'
set container name gatus shared-memory '0'
set container name gatus volume gatus-config source '/config/containers/gatus/config/config.yaml'
set container name gatus volume gatus-config destination '/config/config.yaml'
set container name gatus volume gatus-config mode 'ro'
set container name gatus volume gatus-certificate-crt source '/config/secrets/certificate.crt'
set container name gatus volume gatus-certificate-crt destination '/config/certificate.crt'
set container name gatus volume gatus-certificate-crt mode 'ro'
set container name gatus volume gatus-certificate-key source '/config/secrets/certificate.key'
set container name gatus volume gatus-certificate-key destination '/config/certificate.key'
set container name gatus volume gatus-certificate-key mode 'ro'

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

# haproxy - main cluster
set container name main-k8s-api image 'docker.io/library/haproxy:2.7.7'
set container name main-k8s-api memory '0'
set container name main-k8s-api network services address '10.20.20.10'
set container name main-k8s-api restart 'on-failure'
set container name main-k8s-api shared-memory '0'
set container name main-k8s-api volume config source '/config/containers/main-k8s/config/haproxy.cfg'
set container name main-k8s-api volume config destination '/usr/local/etc/haproxy/haproxy.cfg'
set container name main-k8s-api volume config mode 'ro'

# haproxy - staging cluster
set container name staging-k8s-api image 'docker.io/library/haproxy:2.7.7'
set container name staging-k8s-api memory '0'
set container name staging-k8s-api network services address '10.20.20.11'
set container name staging-k8s-api restart 'on-failure'
set container name staging-k8s-api shared-memory '0'
set container name staging-k8s-api volume config source '/config/containers/staging-k8s/config/haproxy.cfg'
set container name staging-k8s-api volume config destination '/usr/local/etc/haproxy/haproxy.cfg'
set container name staging-k8s-api volume config mode 'ro'

# udp-broadcast-relay-mdns
set container name udp-broadcast-relay-mdns allow-host-networks
set container name udp-broadcast-relay-mdns cap-add 'net-raw'
set container name udp-broadcast-relay-mdns environment CFG_DEV value 'bond0.120;bond0.198;bond0.199'
set container name udp-broadcast-relay-mdns environment CFG_ID value '2'
set container name udp-broadcast-relay-mdns environment CFG_MULTICAST value '224.0.0.251'
set container name udp-broadcast-relay-mdns environment CFG_PORT value '5353'
set container name udp-broadcast-relay-mdns environment SEPARATOR value ';'
set container name udp-broadcast-relay-mdns image 'ghcr.io/onedr0p/udp-broadcast-relay-redux:1.0.27'
set container name udp-broadcast-relay-mdns memory '0'
set container name udp-broadcast-relay-mdns restart 'on-failure'
set container name udp-broadcast-relay-mdns shared-memory '0'

# udp-broadcast-relay-sonos
set container name udp-broadcast-relay-sonos allow-host-networks
set container name udp-broadcast-relay-sonos cap-add 'net-raw'
set container name udp-broadcast-relay-sonos environment CFG_DEV value 'bond0.120;bond0.198;bond0.199'
set container name udp-broadcast-relay-sonos environment CFG_ID value '1'
set container name udp-broadcast-relay-sonos environment CFG_MULTICAST value '239.255.255.250'
set container name udp-broadcast-relay-sonos environment CFG_PORT value '1900'
set container name udp-broadcast-relay-sonos environment SEPARATOR value ';'
set container name udp-broadcast-relay-sonos image 'ghcr.io/onedr0p/udp-broadcast-relay-redux:1.0.27'
set container name udp-broadcast-relay-sonos memory '0'
set container name udp-broadcast-relay-sonos restart 'on-failure'
set container name udp-broadcast-relay-sonos shared-memory '0'

# speedtest-exporter
set container name speedtest-exporter image 'ghcr.io/miguelndecarvalho/speedtest-exporter:v3.5.3'
set container name speedtest-exporter memory '0'
set container name speedtest-exporter allow-host-networks
set container name speedtest-exporter restart 'on-failure'
set container name speedtest-exporter shared-memory '0'

# node exporter
set container name node-exporter allow-host-networks
set container name node-exporter environment procfs value '/host/proc'
set container name node-exporter environment rootfs value '/rootfs'
set container name node-exporter environment sysfs value '/host/sys'
set container name node-exporter image 'quay.io/prometheus/node-exporter:v1.5.0'
set container name node-exporter memory '0'
set container name node-exporter shared-memory '0'
set container name node-exporter volume node-exporter-procfs source '/proc'
set container name node-exporter volume node-exporter-procfs destination '/host/proc'
set container name node-exporter volume node-exporter-procfs mode 'ro'
set container name node-exporter volume node-exporter-rootfs source '/'
set container name node-exporter volume node-exporter-rootfs destination '/rootfs'
set container name node-exporter volume node-exporter-rootfs mode 'ro'
set container name node-exporter volume node-exporter-sysfs source '/sys'
set container name node-exporter volume node-exporter-sysfs destination '/host/sys'
set container name node-exporter volume node-exporter-sysfs mode 'ro'

# vnstat
set container name vnstat allow-host-networks
set container name vnstat environment EXCLUDE_PATTERN value '^docker|^veth|^br-|^lxc|^eth[1234]'
set container name vnstat environment TZ value 'America/New_York'
set container name vnstat image 'ghcr.io/vergoh/vnstat:2.10'
set container name vnstat memory '0'
set container name vnstat shared-memory '0'
set container name vnstat volume vnstat-data source '/config/containers/vnstat'
set container name vnstat volume vnstat-data destination '/var/lib/vnstat'
set container name vnstat volume vnstat-data mode 'rw'
