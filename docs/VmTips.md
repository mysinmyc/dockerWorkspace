
Solutions and workarounds to centos 7 Virtual Machine installations
===================================================================



##Secondary network interfaces doesn't start at boot

Centos installations set by default secondary networks as manual. To make interfaces autostart at boot after setup:
- use nmtui tool to reconfigure autostart at boot 
- set parameter ONBOOT=yes on **/etc/sysconfig/network-scripts/ifcfg-{devicename}**



##Allow inconming connections on hostonly interface

To enable incoming connections on a specific interface at firewall level configure **ZONE=trusted** in **/etc/sysconfig/network-scripts/ifcfg-{devicename}**. It required netwrok restart



##Slow ssh connections

If the ssh connection took a lot of seconds after prompting user name, cause is the missing DNS resolution of client host. Consider to:
- put client ip inside virtual machine **/etc/hosts** 
- reconfigure sshd to disable dns (set **UseDNS no** in **/etc/ssh/sshd_config**)


