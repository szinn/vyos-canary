provider "proxmox" {
  pm_api_url      = data.sops_file.secrets.data["proxmox_url"]
  pm_user         = data.sops_file.secrets.data["proxmox_user"]
  pm_password     = data.sops_file.secrets.data["proxmox_password"]
  pm_tls_insecure = true

  # pm_log_enable       = true
  # pm_log_file         = "terraform-plugin-proxmox.log"
  # pm_debug            = true
  # pm_log_levels       = {
  #   _default          = "debug"
  #   _capturelog       = ""
  # }
}
