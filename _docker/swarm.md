---
title: all about docker swarm
---

## get-started

[swarm deploy](https://docs.docker.com/get-started/swarm-deploy/)

[stack deploy](https://docs.docker.com/engine/swarm/stack-deploy/)

[deploy service to a swarm](https://docs.docker.com/engine/swarm/services/)

## tutorial

[swarm mode key concepts](https://docs.docker.com/engine/swarm/key-concepts/)

[swarm mode overview](https://docs.docker.com/engine/swarm/)

[setup](https://docs.docker.com/engine/swarm/swarm-tutorial/)

[create](https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/)

[add nodes](https://docs.docker.com/engine/swarm/swarm-tutorial/add-nodes/)

[deploy service](https://docs.docker.com/engine/swarm/swarm-tutorial/deploy-service/)

[inspect service](https://docs.docker.com/engine/swarm/swarm-tutorial/inspect-service/)

[scale service](https://docs.docker.com/engine/swarm/swarm-tutorial/scale-service/)

[delete service](https://docs.docker.com/engine/swarm/swarm-tutorial/delete-service/)

[rolling update](https://docs.docker.com/engine/swarm/swarm-tutorial/rolling-update/)

[drain node](https://docs.docker.com/engine/swarm/swarm-tutorial/drain-node/)

[routing mesh](https://docs.docker.com/engine/swarm/ingress/)


## node

```bash
# list
docker node ls

# inspect current node
docker node inspect self
```

## stack

```bash
# deploy
docker stack deploy -c docker-swarm-stack.yml dev_app

# stop and remove an entire stack
docker stack rm dev_app

# list
docker stack ls

# list services
docker stack services dev_app

# list containers
docker stack ps dev_app
```

## services

```bash
# view logs
docker service logs dev_app_django

# inspect service
docker service inspect dev_app_django

# check details of service
docker service ps dev_app_django

# stop a specific service within a stack
docker service scale dev_app_django=0

# temporarily pause a service without removing it
docker service update --replicas 0 dev_app_django

# bring the service back up
docker service update --replicas 1 dev_app_django

# real-time container stats
docker stats $(docker ps -q --filter label=com.docker.swarm.service.name=dev_app_django)
```

## network

[Overlay Docs](https://docs.docker.com/engine/network/drivers/overlay/)
[Swarm Network Management](https://docs.docker.com/engine/swarm/networking/)

```bash
# Create an overlay network (this is default behavior when deploy swarm stack with overlay)
docker network create -d overlay dev_app

# If you want more specific network configurations
docker network create -d overlay \
  --subnet=10.0.0.0/24 \
  --gateway=10.0.0.1 \
  --attachable \
  dev_app

# sample working solution
docker network create --driver overlay --attachable dev_app

# verify the network
docker network inspect swarm_dev_app

# in docker-swarm.yml
networks:
  default:
    name: dev_app
    driver: overlay
    driver_opts:
        # Add any specific network options here if needed
```

## configs

[Docs](https://docs.docker.com/engine/swarm/configs/)

## ingres (routing mesh)

[Docs](https://docs.docker.com/engine/swarm/ingress/)
