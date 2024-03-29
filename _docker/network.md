---
title: all about networking in docker
---

[Docs](https://docs.docker.com/network/)

## drivers

[network drivers](https://docs.docker.com/network/drivers/)

[network drivers tutorial](https://www.youtube.com/watch?v=fBRgw5dyBd4&ab_channel=AntonPutra)

## containers with static ip

Found two methods:

### use bridge (NAT) to utilize static address

[Docs](https://docs.docker.com/compose/compose-file/compose-file-v3/#ipv4_address-ipv6_address)

[Great Example](https://gist.github.com/natcl/3d881d00a56c8a961e6dab8ba51a5a37)

[Problem Definintion](https://forums.docker.com/t/static-ip-on-docker-containers/110412)

### use macvlan or IPvlan network driver (without NAT)

[Macvlan driver](https://docs.docker.com/network/drivers/macvlan/)
[IPvlan driver](https://docs.docker.com/network/drivers/ipvlan/)

[Macvlan manual](https://4sysops.com/archives/macvlan-network-driver-assign-mac-address-to-docker-containers/)

[IPvlan manual](https://4sysops.com/archives/configuring-ipvlan-networking-in-docker/)

Between Macvlan and IPvlan, the latter has advantages such as not needing MAC addresses, which can be useful in large-scale scenarios.

Macvlan is a type of network driver in Docker that allows you to assign a MAC address to a container, making it appear as a physical device on the network. With Macvlan, each container has its own unique MAC address and can be assigned an IP address from the subnet defined by the network configuration. This enables containers to communicate directly with other devices on the network as if they were physical machines.

Using Macvlan in Docker allows you to assign static IP addresses to containers, providing a way to ensure consistent network configurations across container restarts or updates. By defining a custom Macvlan network in your Docker Compose file and specifying static IP addresses for each container, you can achieve the desired network setup with fixed IP assignments.

In summary, Macvlan is a network driver in Docker that enables containers to have their own MAC and IP addresses, making them appear as individual devices on the network. This feature can be utilized to assign static IP addresses to containers, ensuring stable network configurations within a Docker environment.

[Great Exmaple](https://stackoverflow.com/questions/76875581/docker-compose-use-ipvlan-with-static-address-for-a-dhcp-server)

[Question-Answer Link](https://forums.docker.com/t/how-do-i-attach-a-macvlan-network-and-assign-a-static-ip-address-in-compose-file/107419)

## monitoring

[monitoring](https://github.com/LeoVerto/docker-network-graph)
