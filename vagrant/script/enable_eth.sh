cat <<EOF >> /etc/netplan/01-netcfg.yaml
    eth1:
      dhcp4: true
EOF

netplan apply > /dev/null 2>&1
