# tap-router-exit
## Overview
Debian Jessie TAP based VPN-Router

This ansible-role installs software to provide basic network-services for VPNs in TAP-Interfaces.

- dnsmasq for dhcp
- radvd for radv
- unbound for dns

The role handles multiple interface. For each interface, these settings are created:

- Static interface definition in /etc/network/interfaces.d/
- dnsmasq interface defintion in /etc/dnsmasd.conf.d/
- interface definition in /etc/radvd.conf

Note: This role doesn't care about VPN-service the interfaces - it only defines the tap-interfaces



## Example Playbook

```
hosts: servers
  vars: 
    tap_vpn_interfaces:
      fastd-exit:
        ipv6: 2001:67C:20A0:B100::1
        ipv4: 172.26.32.1
        ipv4_netmask: 255.255.224.0
        dhcp_start: 172.26.32.10
        dhcp_end: 172.16.26.61.254
  roles:
    - tap-router-exit
```
Notes: 

- IPv6-networks are /64 
- The python ipcalc module is needed on the host


## Variables
`tap_vpn_interfaces` Dictionary of interface definitons. Keys are used as interface-names. Each entry has these values:

- `ipv6` - IPv6-Address of the interface. Default: `fe80::1`
- `ipv4` - IPv4-Address of the interface. Default `172.26.0.1`
- `ipv4_network` - IPv4 netmask of the interface. Default `255.255.224.0`
- `dhcp_start` - Start address of DHCP-Pool. Default: `172.26.0.2`
- `dhcp_end` - End address of DHCP-Pool. Default `172.26.31.254`

