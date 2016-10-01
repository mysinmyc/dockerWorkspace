DOCKER NOTES
============



## Tags

\#docker,\#centos,\#sytemd,\#usens



## Environment
in my pc typically i work in a virtual machine guest Centos/7.
Guest is configure with two virtual nics:

- a nat network to access to internet

- an host only network to reach my pc.

It simplifies firewall rules (by making the hostonly interface as  trusted) and also allows to disconnect the virtual machine from internet by  putting down the first interface



## Docker installation

execute as root
````
curl https://get.docker.com | sh
systemctl enable docker
systemctl start docker
````



## Modify docker startup paramaters

logged as root

- create systemd configuration file `cp /usr/lib/systemd/system/docker.service /etc/systemd/system/docker.service`

- edit */etc/systemd/system/docker.service*

- notify changes to systemd `systemctl daemon-reload`



## Configure usenamespace

Usernamespace allows to remap userid inside the container. It must be made before any other configuration because it changes the */var/lib/docker* to */var/lib/docker/1000000.1000000*
After this configuration real user id of container processes inside the host will be 1000000+(container user id)

I've found some issues with usernamespace and selinux in docker 1.12 (for the moment i've disabled selinux wihtout analyzing in depth)

- add usernamespace kernel parameter

 - edit file */etc/default/grub* and add *user_namespace.enable=1* into *GRUB_CMDLINE_LINUX* variabile

 - update grub boot configuration  `grub2-mkconfig -o /boot/grub2/grub.cfg`

- add *--userns-remap=default* parameter to docker start command in */etc/systemd/system/docker.service*

- create file */etc/subuid*

> dockremap:1000000:65536

- create file */etc/subgid*

> dockremap:1000000:65536

- reboot

### Run a container witout usernamespace

For some container could be necessary to disable user namespace (in case ho nfs mount or net=host). to run a container without user namespace add parameter *--userns=host* to *docker run* command
