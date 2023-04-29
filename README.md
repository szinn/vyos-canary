# vyos-canary

Canary testing for VyOS images.

## Preparing VyOS Proxmox VM

* Adjust `.sops.yaml` with your sops key
* Adjust `terraform/secrets.sops.yaml` with your proxmox credentials
* Adjust the VyOS image you want to start with in `terraform/locals.tf` and upload that image to Proxmox

## Creating VyOS Proxmox VM

```shell
terraform init
terraform plan
terraform apply -auto-approve
```

## Installing Base VyOS

Start the VyOS VM if it hasn't been started and install the image, following the prompts.

```shell
install image
```

Before rebooting VyOS, disconnect the CDROM image.

```shell
reboot
```

VyOS should reboot and you can login using vyos and the password you set during the install image process.

## Bootstrapping Configuration

Log in to the VyOS console and execute:

```shell
configure
set interfaces ethernet eth0 address 'dhcp'
set service ssh port '22'
set system name-server '1.1.1.1'
commit
save
exit

which will start the first ethernet address and allow you to ssh into the console from a desktop terminal with

```shell
ssh vyos@<VyOS_IP>
```

using your vyos credentials.

## Cloning Canary Repo

```shell
cd /config
rm -f scripts/vyos-postconfig-bootup.script
git config --global init.defaultBranch main
git config --global --add safe.directory /config
git init
git remote add origin https://github.com/szinn/vyos-canary.git
git pull origin main
git branch --set-upstream-to=origin/main main
git checkout main -f
```

## Upgrading System Image

```shell
add system image https://github.com/onedr0p/vyos/releases/download/v1.4-rolling-202304290305/vyos-1.4-rolling-202304290305-amd64.iso
```
