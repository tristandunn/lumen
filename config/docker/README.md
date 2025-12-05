# Docker

## Service

```sh
# Stop the daemon.
sudo systemctl stop docker

# Disable on boot.
sudo systemctl disable docker
```

## List

```sh
# List containers, including stopped.
docker ps -a

# List images.
docker images

# List volumes.
docker volume ls

# Show disk usage.
docker system df
```

## Cleanup

```sh
# Remove stopped containers.
docker container prune

# Remove unused volumes.
docker volume prune

# Remove unused images.
docker image prune

# Remove all unused data.
docker system prune -a --volumes
```
