Docker Volume

- Two types of volume mounts : Named (docker volumes) and Bind

## Named Volumes:

- Mounting a volume created using docker volume create command
- Created under default volume location /var/lib/docker/volumes

```
# Create the Volume
$ docker volume created my-vol
```

```
# Once we create a volume the volume stored in
$ cd  /var/lib/docker/volumes/my-vol/_data/
```

```
# To inspect the volume

$ docker inspect nginx_backup
[
    {
        "CreatedAt": "2026-01-18T05:26:02Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/nginx_backup/_data",
        "Name": "nginx_backup",
        "Options": null,
        "Scope": "local"
    }
]

```

- By Default to docker volume folder directory is stored
  - cd /var/lib/docker/volume

```
# TO Mount the location of the container into the volume
$ docker run -d --name web -p 80:80 -v nginx_backup:/usr/share/nginx/html image_name
```

- Attach Multiple volume in the container

```
# Create 2 Volume
$ docker volume nginx_backup
$ docker volume nginx_log

# Then attack the 2 volume into the same container

# docker run -d --name nginx_container -p 80:80 \
    -v nginx_backup:/usr/share/nginx/html \
    -v nginx_log:/var/log/nginx \
    a08986c3111a


```

docker volume prune -a

### Mount and Target

```
# Create a Volume
$ docker volume create nginx_data nginx_log

# Mount the volume into the container using --v
$ docker run -d --name -web -p 80:80 \
    --v nginx_data:/usr/share/nginx/html
    --v nginx_log:/var/log/nginx
    nginx_image

# Mount the volume into the container using --mount
$ docker run -d --name -web -p 80:80 \
    --mount src=nginx_data, target:/usr/share/nginx/html:ro
    --mount src=nginx_log, target:/var/log/nginx:ro
    nginx_image
```

## Docker Read-Only Volumes

- Read-only Volumes
  - Sometimes the container only need read access to the data
  - Multiple containers can mount the same volume, and it can be mounted
    read-write for some of them and read-only for others, at the same time

```
$ docker run -d --name=nginx -v nginx-vol:/usr/share/nginx/html:ro nginx

$ docker run -d \
	--name=nginxcontainer \
	--mount source=nginx-vol, destination=/usr/share/nginx/html,readonly \
	nginx:latest
```

## Bind Volumes:

- Mounting an existing volume stored anywhere on the host system
- They usually start with /, $PWD, ./

```
$ docker run --name web -v /tmp/html:/usr/share/nginx/html nginx:latest
$ docker run --rm -v $PWD:/tmp ubuntu:latest bash -c "echo Hello > /tmp/hello.txt"
$ docker run --name web \
    -v /home/ec2-user/ny_nginx_config:/usr/share/nginx/html \
    nginx:latest
```
