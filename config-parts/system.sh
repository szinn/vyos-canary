#!/bin/vbash

set system login banner post-login 'Welcome to VyOS Canary'

set system ipv6 disable-forwarding

set system login user vyos authentication public-keys scotte key 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDP1JMwwIE7/qpqLNOvIcYNy6CHhfR8S/Tm0ZCBFchcsPuvtQ2yuqjmi6DGaDiUzV2ln8tFzBVhi+eOor9r5l/XwK0wcNpuBbdNf0/C0z6SklEKZctU5sCFvEIw4V4WfNctChrarPCfZo7lae/7PJKtYQDuqwC0KWY2I43+kPPkR0o+sRYcMdvYgBHcNfUQNcXoO0nWlMcaEocmcFBq82E7RI8uY5RR6liF/VvpIj5C9FviTd7IIFdhVy+w6p7QJr/kUQAQCYF2sVrAH+ZqVVUh18LhaA0SM4mqnJyaCqKfdl8orufRaI61uxS70RlnJH0WYALejOqtx7IBMJGOdTM0ZlCYYpfqqUrRvbYQdiMlfXSCoMk8r3ldSY+FLw3FBMnOzUK35Srio1g6xoYsRChQbLZiJKDBRcGNghmiLuT3EsGF37+hjOOtKWLXXSnPZQKQckc5O1spSW4oR8Ij4JXfDyKL0n5H+MPn8oThK+jePTmCPLKMUo9OpFAtz/maZ8z8mAkHpdVt7mjL3D1sEGkIbo6XDjICfFEjLbnVJhKWAXluuAkzL9Bp52lkop8V4ALk5oTVe/c52oJQhiD6XVjwjJJ0DrvGScLhDzZARpd1d2eaGE4fbow8NgkkW5lpaXNvW0bN6L/+7N4nHLPWD9WKRU6Lee2FXk0C5Gnn1QB0zQ=='
set system login user vyos authentication public-keys scotte type 'ssh-rsa'
set system login user vyos authentication public-keys scotte-tech key 'AAAAC3NzaC1lZDI1NTE5AAAAIN7T92EOEawunpuGClUPZtjl6gLjqz+X2xvLuvmk0UFn scotte@zinn.ca'
set system login user vyos authentication public-keys scotte-tech type 'ssh-ed25519'

set system name-server '1.1.1.1'

set system sysctl parameter kernel.pty.max value '24000'

set system time-zone 'America/Toronto'
