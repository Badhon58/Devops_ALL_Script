- Docker Volumes
  - Bind
  - Named
  - Shared

- For Docker Volume
  - docker run --name test --rm ubuntu:latest bash -c "echo Hello > Hello.txt && cat Hello.txt"
  - docker run --name test --rm ubuntu:latest bash -c "cat Hello.txt"

- **Volume Type**
  - Named Volume (Docker Volume)
  - Bind Volume

- **Named Volume**
  - Mounting a volume created using docker volume create command
  - Created under default volume location /var/lib/docker/volumes

```bash
        docker volume create my-vol
        docker volume inspect my-vol # It will give you the directory where this volume is linked
        docker run -d --name web -v my-vol:/usr/share/nginx/html nginx:latest
        docker run -d --name web \
            --mount source=myvol2, target=/usr/share/nginx/html \
            nginx:latest
```

docker default volume host

- /var/lib/docker/volumes/my-vol/\_data/
