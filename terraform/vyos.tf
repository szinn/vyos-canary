resource "proxmox_vm_qemu" "vyos" {
  name        = "vyos"
  target_node = local.pm_host_name
  vmid        = 300
  desc        = "VyOS Router"
  iso         = local.vyos_iso
  onboot      = false
  boot        = "order=ide2;scsi0"
  memory      = 32768
  balloon     = 0
  sockets     = 1
  cores       = 8
  cpu         = "host"
  scsihw      = "virtio-scsi-pci"

  vga {
    type   = "virtio"
    memory = 32
  }
  disk {
    size     = "20G"
    type     = "scsi"
    storage  = "local-lvm"
    iothread = 0
  }

  network {
    model    = "virtio"
    bridge   = "vmbr0"
    macaddr  = local.network_98_macaddr
    tag      = 98
    firewall = false
    mtu      = 1500
    queues   = 0
    rate     = 0
  }

  network {
    model    = "virtio"
    bridge   = "vmbr0"
    macaddr  = local.network_99_macaddr
    tag      = 99
    firewall = false
    mtu      = 1500
    queues   = 0
    rate     = 0
  }

  lifecycle {
    ignore_changes = [qemu_os, args, clone, hagroup, target_node, full_clone, network]
  }
}
