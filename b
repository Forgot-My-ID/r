!Dist-2
enable
configure terminal
interface GigabitEthernet0/0
 ip address 10.28.88.10 255.255.255.248
 no shutdown
exit
interface GigabitEthernet2/0.10
 encapsulation dot1Q 10
 ip address 10.28.40.1 255.255.248.0
exit
interface GigabitEthernet2/0.20
 encapsulation dot1Q 20
 ip address 10.28.68.1 255.255.252.0
exit
interface GigabitEthernet2/0.30
 encapsulation dot1Q 30
 ip address 10.28.82.1 255.255.254.0
exit
router ospf 1
 router-id 2.2.2.2
 network 10.28.88.8 0.0.0.7 area 1
 network 10.28.40.0 0.0.7.255 area 1
 network 10.28.68.0 0.0.3.255 area 1
 network 10.28.82.0 0.0.1.255 area 1
exit
ip dhcp excluded-address 10.28.40.1 10.28.47.255
ip dhcp excluded-address 10.28.68.1 10.28.71.255
ip dhcp excluded-address 10.28.82.1 10.28.83.255
ip dhcp pool vlan10
 network 10.28.40.0 255.255.248.0
 default-router 10.28.40.1
 dns-server 103.133.254.2
exit
ip dhcp pool vlan20
 network 10.28.68.0 255.255.252.0
 default-router 10.28.68.1
 dns-server 103.133.254.2
exit
ip dhcp pool vlan30
 network 10.28.82.0 255.255.254.0
 default-router 10.28.82.1
 dns-server 103.133.254.2
exit
end
copy running-config startup-config


!Dist-Switch-2
enable
configure terminal
spanning-tree mode pvst
vlan 10
name Student
vlan 20
name Teacher
vlan 30
name Academic
interface FastEthernet0/1
switchport access vlan 10
switchport trunk encapsulation dot1q
switchport mode access
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
switchport trunk encapsulation dot1q
switchport mode trunk
exit
interface GigabitEthernet0/2
switchport trunk encapsulation dot1q
switchport mode trunk
exit
interface Vlan1
no ip address
shutdown
exit
end
copy running-config startup-config
