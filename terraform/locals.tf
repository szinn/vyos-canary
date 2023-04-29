locals {
  pm_host_name = data.sops_file.secrets.data["proxmox_hostname"]

  vyos_iso = "local:iso/vyos-1.4-rolling-202303310306-amd64.iso"

  network_98_macaddr = "DE:CA:FF:98:01:F0"  
  network_99_macaddr = "DE:CA:FF:99:02:F0"  
}
