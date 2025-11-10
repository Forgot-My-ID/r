!Dist-3
enable
configure terminal
hostname DR3
interface GigabitEthernet0/0
 ip address 10.28.88.18 255.255.255.248
 no shutdown
exit
interface GigabitEthernet2/0.10
 encapsulation dot1Q 10
 ip address 10.28.48.1 255.255.248.0
exit
interface GigabitEthernet2/0.20
 encapsulation dot1Q 20
 ip address 10.28.72.1 255.255.252.0
exit
interface GigabitEthernet2/0.30
 encapsulation dot1Q 30
 ip address 10.28.84.1 255.255.254.0
exit
router ospf 1
 router-id 3.3.3.3
 network 10.28.88.16 0.0.0.7 area 2
 network 10.28.48.0 0.0.7.255 area 2
 network 10.28.72.0 0.0.3.255 area 2
 network 10.28.84.0 0.0.1.255 area 2
exit
ip dhcp excluded-address 10.28.48.1 10.28.55.255
ip dhcp excluded-address 10.28.72.1 10.28.75.255
ip dhcp excluded-address 10.28.84.1 10.28.85.255
ip dhcp pool vlan10
 network 10.28.48.0 255.255.248.0
 default-router 10.28.48.1
 dns-server 103.133.254.2
exit
ip dhcp pool vlan20
 network 10.28.72.0 255.255.252.0
 default-router 10.28.72.1
 dns-server 103.133.254.2
exit
ip dhcp pool vlan30
 network 10.28.84.0 255.255.254.0
 default-router 10.28.84.1
 dns-server 103.133.254.2
exit
end
copy running-config startup-config

!Dist-Switch-3
enable
configure terminal
hostname Switch
spanning-tree mode pvst
interface FastEthernet0/1
 switchport access vlan 10
 switchport mode access
 switchport nonegotiate
exit
interface FastEthernet0/2
 switchport access vlan 10
exit
interface FastEthernet0/3
 switchport access vlan 10
exit
interface FastEthernet0/4
 switchport access vlan 10
exit
interface FastEthernet0/5
 switchport access vlan 10
exit
interface FastEthernet0/6
 switchport access vlan 10
exit
interface FastEthernet0/7
 switchport access vlan 10
exit
interface FastEthernet0/8
 switchport access vlan 10
exit
interface FastEthernet0/9
 switchport access vlan 20
exit
interface FastEthernet0/10
 switchport access vlan 20
exit
interface FastEthernet0/11
 switchport access vlan 20
exit
interface FastEthernet0/12
 switchport access vlan 20
exit
interface FastEthernet0/13
 switchport access vlan 20
exit
interface FastEthernet0/14
 switchport access vlan 20
exit
interface FastEthernet0/15
 switchport access vlan 20
exit
interface FastEthernet0/16
 switchport access vlan 20
exit
interface FastEthernet0/17
 switchport access vlan 30
exit
interface FastEthernet0/18
 switchport access vlan 30
exit
interface FastEthernet0/19
 switchport access vlan 30
exit
interface FastEthernet0/20
 switchport access vlan 30
exit
interface FastEthernet0/21
 switchport access vlan 30
exit
interface FastEthernet0/22
 switchport access vlan 30
exit
interface FastEthernet0/23
 switchport access vlan 30
exit
interface FastEthernet0/24
 switchport access vlan 30
exit
interface GigabitEthernet0/1
 switchport mode trunk
exit
interface GigabitEthernet0/2
 switchport mode trunk
exit
end
copy running-config startup-config
